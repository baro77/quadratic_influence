
#
# function: p(y,n,i)
#
function result=PY(YY,nn,ii)
for Counter_ii= 1:length(ii)
    i=ii(Counter_ii);
    for Counter_nn= 1:length(nn)
        n=nn(Counter_nn);
        max_i=floor(n/2)+1;
        if (i > max_i)
            i=max_i;
        endif
        d=[max_i-i:n-i];
        for Counter_YY= 1:length(YY)
            Y=YY(Counter_YY);
            values(Counter_YY,Counter_nn,Counter_ii)=sum(bincoeff(n-i,d).*(Y.^d).*((1-Y).^(n-i-d)));
        endfor
    endfor
endfor
result=values;
endfunction



#
# function: delta_p(y,n,i) = p(y,n,i) - p(y,n,i-1)
#
function result=deltaPY(YY,nn,ii)
result=PY(YY,nn,ii)-PY(YY,nn,ii-1);
endfunction



#
# Plots [y;p(y,n,0)] with y=(0, 0.01, 0.02, ..., 1), n=(10, 20, 40, 80, 160, 320, 640)
#
# (1st referendum graph of the article)
#
y=linspace(0,1,101);
plot(y,PY(y,10,0),";n = 10;",y,PY(y,20,0),";n = 20;",y,PY(y,40,0),";n = 40;",y,PY(y,80,0),";n = 80;",y,PY(y,160,0),";n = 160;",y,PY(y,320,0),";n = 320;",y,PY(y,640,0),";n = 640;")
axis([0,1,0,1]);
legend("location", "northwest")
legend("boxoff")
grid on
ylabel("p(y,n)")
xlabel("y")



#
# Plots [n;p(y,n,0)] with n=(1, 2, ..., 100), y=(0.3, 0.5, 0.7)
#
# (2nd referendum graph of the article)
#
nmax=100;
n=linspace(1,nmax,nmax);
legend("location", "northeast")
plot(n,PY(0.5,n,0),";y=0.5;",n,PY(0.3,n,0),";y=0.3;",n,PY(0.7,n,0),";y=0.7;")
legend("boxoff")
grid on
ylabel("p(y,n)")
xlabel("n")



#
# Plots [i;p(y,100,i)] with i=(0, 1, 2, ..., 60), y=(0.1, 0.2, 0.3, 0.4, 0.5, 0.6)
#
# (3rd referendum graph of the article)
#
i=linspace(0,60,61);
plot(i,PY(0.1,100,i),";y=0.1;",i,PY(0.2,100,i),";y=0.2;",i,PY(0.3,100,i),";y=0.3;",i,PY(0.4,100,i),";y=0.4;",i,PY(0.5,100,i),";y=0.5;",i,PY(0.6,100,i),";y=0.6;")
axis([0,60,0,1]);
legend("boxoff")
grid on
ylabel("p(y,100,i)")
xlabel("i")



#
# Plots [i;delta_p(y,100,i)] with i=(1, 2, ..., 60), y=(0.1, 0.2, 0.3, 0.4, 0.5, 0.6)
#
# (4th referendum graph of the article)
#
i=linspace(1,60,60);
plot(i,deltaPY(0.1,100,i),";y=0.1;",i,deltaPY(0.2,100,i),";y=0.2;",i,deltaPY(0.3,100,i),";y=0.3;",i,deltaPY(0.4,100,i),";y=0.4;",i,deltaPY(0.5,100,i),";y=0.5;",i,deltaPY(0.6,100,i),";y=0.6;")
axis([0,60,0,0.2]);
legend("boxoff")
grid on
ylabel("\\Deltap(y,100,i)")
xlabel("i")

