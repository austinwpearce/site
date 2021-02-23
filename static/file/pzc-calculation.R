library(tidyverse)

# more visually appealing plots
theme_set(
  hrbrthemes::theme_ipsum_rc(
    axis_title_just = "br",
    axis_title_size = 14,
    plot_margin = margin(t = 2, r = 2, b = 2, l = 2, unit = "mm"),
    grid_col = "#F1F1F1"
  )
)

# Import data with pH as "ph" in first column, the anion as "anion" in second column, and cation as "cation" in third and last column

# Manual Method ---------------------------------------------------------------
# start by typing in all values, in order obviously
# this must be done first
data <- tibble(pH    =  c(3.2,  3.4,  3.75, 4.1,  4.85, 6.4,   6.7),
               Anion  =  c(2.6,  2.3,  1.7,  1.4,  0.7,  0.055, 0.052),
               Cation = -c(0.76, 0.81, 0.64, 0.71, 1.34, 2.42,  3.31)) %>% 
  mutate(Net = Anion + Cation) %>% 
  arrange(desc(Net))

# Find PZC --------------------------------------------------------------------
# find pzc by calculating slope of line between last positive (AEC) point
pos <- filter(data, Net > 0) %>%
  select(pH, Net) %>% 
  tail(n = 1)

# and first negative (CEC) point
neg <- filter(data, Net < 0) %>%
  select(pH, Net) %>% 
  head(n = 1)

# and finding point of x-intercept
pzc <- ((0 - pos$Net) / ((neg$Net - pos$Net) / (neg$pH - pos$pH))) + pos$pH

pzc_label <- round(pzc, digits = 2)

# Plot 1 -----------------------------------------------------------------------
# code for plot with net charge line going through pH axis.
# Where net charge equals zero, that is Point of Zero Charge at the observed pH.
# I know the code is long, but whatever
data %>% 
  pivot_longer(names_to = "Measure",
               values_to = "Value",
               cols = 2:4) %>% 
  mutate(Measure = factor(Measure, levels = c('Anion', 'Net', 'Cation'))) %>%
  ggplot(aes(x = pH, y = Value, linetype = Measure)) +
  geom_line() +
  geom_point() +
  # zero line
  geom_hline(yintercept = 0,
             alpha = 0.4) +
  # PZC point
  geom_point(aes(x = pzc, y = 0),
             color = "#CC0000",
             size = 3,
             pch = 1) +
  # annotations for labels
  annotate(geom = 'text',
           label = pzc_label,
           x = pzc + 0.1, y = 0.3,
           family = rc) +
  annotate(geom = 'text',
           label = "AEC +",
           x = min(data$pH), y = 0.2,
           family = rc) +
  annotate(geom = 'text',
           label = "CEC -",
           x = min(data$pH), y = -0.2,
           family = rc) +
  scale_x_continuous(breaks = seq(0, 14, 0.5)) +
  scale_linetype_manual(values = c(2, 1, 3)) +
  labs(title = "Point of Zero Charge",
       x = "pH",
       y = "Net Charge",
       linetype = NULL)

ggsave("static/pzc.png", dpi = 300, height = 5, width = 7)
