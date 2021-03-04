

i=0
for N=0.5:0.1:20
    i=i+1
    r=0.15;
    L=50000
    p(i)=r.*L.*power((1+r./12),12.*N)/(12.*(power((1+r./12),12.*N)-1));
    
end
N=0.5:0.1:20;
plot(N,p);
xlabel("months");
ylabel("monthly payment")
text(0,0,"Jiyuan Jia")