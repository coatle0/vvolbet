code<-code_get()
ohlc_xts<- tqk_get(code$code[1],'2023-0801')
vsd<-sd(ohlc_xts$volume)
vsd_lim <- vsd*2
evt_ary<-which(rev(ohlc_xts$volume)>vsd_lim)
chartSeries(ohlc_xts,TA="addVo();addLines(v=evt_ary,on=-1,col='red')")
vsig_ref <- evt_ary[5]
chartSeries(ohlc_xts[nrow(ohlc_xts):1,][(vsig_ref-10):(vsig_ref+10),],TA="addVo();addLines(v=11,on=-1,col='red')")