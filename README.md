# Trading Strategy for SPY

### 背景說明
- 這是台大『金融科技導論』期末專題

### 目的
- 以spy(SPDR S&P 500)為對象，實作一個交易策略並進行回測。

### 定義
- 參數 "pastData" 是從1993年1月29日開始的歷史數據集，最新數據附加在數組的末尾。
- 返回值 "操作" 為[1，-1]。 1表示"購買"，-1表示"出售"，0表示"無操作"。
- 在第（i）天執行交易操作基於AdjOpen（i），定義為Open（i）+ AdjClose（i-1）- Close（i-1）。

### 資料
- 2724個日交易記錄的數據點。
- 記錄包括日期，打開，高，低，關閉，調整關閉，成交量等列

### 實驗#1
- 作為baseline
- 比較收盤價（AdjClose）和移動平均(Moving Average)以分辨市場趨勢：
  - AdjClose> SMA：漲勢
  - AdjClose <SMA：跌勢
- 順勢操作
  - 漲勢則買
  - 跌勢則賣
- 回測結果
  - 最佳的組合為：240日MA，投報率 119%
  
### 實驗2
- 比較順勢操作和逆勢操作交易策略的投報率
- 順勢操作
  - 漲勢則買/跌勢則賣
- 逆勢操作
  - 跌勢則買/跌勢則買
- 回測結果
  - 順勢操作在長期投資上有較佳成績
  - 逆勢操作在短線操作上有較佳成績
  - 其中又以5日均線指標的逆勢操作的回報率最高，為267%，遠高於baseline的119%。
  
### 實驗3
- 比較SMA,WMA,EMA三項指標用於逆勢操作的回報率
- 比較不同移動窗口(1~500)的投報率
- 回測結果
  - 基於SMA指標的逆勢操作:當window為5時，得到最大投報率 319.606%。
  ![SMA.png](https://github.com/alexislintw/trading_strategy_for_spy/blob/master/report/sma.png)
  - 基於WMA指標的逆勢操作:當window為5時，得到最大投報率294.176%。
  ![WMA.png](https://github.com/alexislintw/trading_strategy_for_spy/blob/master/report/wma.png)
  - 基於EMA指標的逆勢操作:當window為4時，得到最大投報率 330.54%。
  ![EMA.png](https://github.com/alexislintw/trading_strategy_for_spy/blob/master/report/ema.png)

