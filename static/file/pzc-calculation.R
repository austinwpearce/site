require('tidyverse')

# Import data with pH as 'ph' in first column, the anion as 'anion' in second column, and cation as 'cation' in third and last column

# Manual Method ---------------------------------------------------------------
# start by typing in all values, in order obviously
# this must be done first
ph <- c(3.2, 3.4, 3.75, 4.1, 4.85, 6.4, 6.7)

anion <- c(2.6, 2.3, 1.7, 1.4, 0.7, 0.055, 0.052)

cation <- c(0.76, 0.81, 0.64, 0.71, 1.34, 2.42, 3.31)

# For scaling the plot later on, grab the first and last pH values
ph.first <- head(ph, n = 1)

ph.last <- tail(ph, n = 1)

# net charge is the difference between the anion and cation -------------------
# note that there is a positive net charge for AEC
# and negative net charge for CEC
net <- anion - cation

# stitch it all together in a data frame --------------------------------------
df.pzc <- data_frame(ph, anion, cation, net) %>% 
  arrange(., desc(net))

# long form of the data frame
df.pzc2 <- data_frame(ph, anion, -cation, net) %>% 
  arrange(desc(net)) %>% 
  gather(key = "measure",
         value = "value",
         2:4)

df.pzc2$measure2 <- factor(df.pzc2$measure,
                  levels = c('anion', 'net', '-cation'))

# Find PZC --------------------------------------------------------------------
# find pzc by calculating slope of line between last positive (AEC) point
pos <- filter(df.pzc, net > 0) %>%
  select(ph, net) %>% 
  tail(n = 1)

# and first negative (CEC) point
neg <- filter(df.pzc, net < 0) %>%
  select(ph, net) %>% 
  head(n = 1)

# and finding point of x-intercept
slope <- (neg$net - pos$net) / (neg$ph - pos$ph)

pzc <- ((0 - pos$net) / slope) + pos$ph

pzc.label <- round(pzc, digits = 2)

# Plot 1 -----------------------------------------------------------------------
# code for plot with net charge line going through pH axis.
# Where net charge equals zero, that is Point of Zero Charge at the observed pH.
# I know the code is long, but whatever
ggplot(data = df.pzc2,
       aes(x = ph, y = value, linetype = measure2)) +
  geom_line() +
  geom_point(size = 1) +
  # zero line
  geom_hline(yintercept = 0,
             alpha = 0.4) +
  # PZC point
  geom_point(aes(x = pzc, y = 0),
             color = 'red',
             size = 3,
             pch = 18) +
  # annotations for labels
  annotate(geom = 'text',
           label = pzc.label,
           x = pzc + 0.1, y = 0.3,
           family = 'serif') +
  annotate(geom = 'text',
           label = "AEC",
           x = ph[[2]], y = 0.2,
           family = 'serif') +
  annotate(geom = 'text',
           label = "CEC",
           x = ph[[2]], y = -0.2,
           family = 'serif') +
  scale_x_continuous(breaks = seq(from = ph.first,
                                  to = ph.last,
                                  by = (ph.last - ph.first))) +
  scale_linetype_manual(values = c(2, 1, 3),
                        labels = c("Anion", "Net Charge", "Cation")) +
  labs(title = "Point of Zero Charge",
       x = "pH",
       y = "Net Charge",
       linetype = NULL) +
  theme_classic(base_family = 'serif', base_size = 14)

ggsave(filename = "pzc.png",
       dpi = 1200,
       height = 5,
       width = 7)
