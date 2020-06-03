
#
# A second function defining p(y,n,i) in a more Octave-ish way, thanks to use of matrix algebra instead of almost all "for" cycles
#
# (It needs a meshgrid-based input -see following code- and returns a 3D array -suitable for mesh plotting function once one dimension is locked)
#
function result=PY2(yyy,nnn,iii)
    max_iii = floor(nnn/2)+1;
    dummy = max_iii-iii;                         # must iii <= max_iii <= nnn           
    iii = -((dummy + abs(dummy))/2)+max_iii;     # 
    ddd = max_iii-iii;                         # first ddd of the summation
    freewill_nnn = nnn-iii;

    max_sumcounter = max(max(max(freewill_nnn-ddd)));
    result = 0;
    for sumcounter = 0:max_sumcounter
        result = result+(bincoeff(freewill_nnn,ddd).*(yyy.^ddd).*((1-yyy).^abs(freewill_nnn-ddd)));
        ++ddd;                                                       # abs to avoid 0 .* inf = NaN
    endfor
endfunction




#
# Code used to generate the files contained in BALLOT_PRECOMPUTED_PYs/ folder
#
# NOTE: values array size is 1000x101x502 (and not 101x1000x502 as expected, given p(y,n,i) arguments order) due to meshgrid behavior (please check meshgrid VS ndgrid in Octave's help)
#
y=linspace(0,1,101);
n=linspace(1,1000,1000);
i=linspace(0,501,502);
[yyy,nnn,iii]=meshgrid(y,n,i);
values=PY2(yyy,nnn,iii);             # very slow with so big domain
for c= 1:101
cc=c-1;
filename=["PY_1000_502-py" num2str(cc,"%03d") ".octave_text"];
rtemp=values(:,c,:);
save("-text",filename,"rtemp");
endfor




#
# Example of code to reconstruct a 1000x101x502 matrix (the result of PY2(...)) from 101 files created by previous code
#
# (NOTE: instead of downloading files manually, you could use "urlread" and "urlwrite" Octave functions on GitHub raw files links)
#
for c= 1:101
cc=c-1;
nomefile=["PY_1000_502-py" num2str(cc,"%03d") ".octave_text"];
values(:,c,:)=load(nomefile).rtemp;
endfor

