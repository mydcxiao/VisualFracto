%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function [PSNR] = psnr(X,Y)
% function to calculate the value of psnr
D=X-Y;
MSE=sum(D(:).*D(:))/numel(X);
PSNR=10*log10(1/MSE);
end