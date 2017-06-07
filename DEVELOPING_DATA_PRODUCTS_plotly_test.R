library(plotly)

plot_ly(x = monthly$Month, y = monthly$Income, trace = 'histogram2d')

head(EuStockMarkets)

library(dplyr)
library(tidyr)
stock <- as.data.frame(EuStockMarkets)
stock1 <- gather(as.data.frame(EuStockMarkets), index, price)
stock1 <- mutate(stock1, time = rep(time(EuStockMarkets), 4))
stock <- mutate(stock, time = time(EuStockMarkets))
plot_ly(x = stock$DAX, type = 'histogram')


library(ggplot2)
g <- ggplot(quakes, aes(x = depth, y = mag)) +
  geom_point() +
  geom_smooth()
ggplotly(g)

