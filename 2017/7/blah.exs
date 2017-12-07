q=&String.pad_trailing&1,&2,&3
w=&IO.puts q.("",8-div(&2-1,2)," ")<>q.("",&2,&1)
w.("*",1)
for n<-1..9,do: w.("0",2*n-1)
w.("H",1)
