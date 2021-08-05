%%------------------------------------------------------------------------------------------------------------------------------------------------
%%Author(s): Xiao Yuhang
%%Date: 2020/4/29
%%2020 Copyright: all rights for this program are reserved to FAMS Laboratory at the University of Michigan Jiao Tongy University -Joint Instiute.  
%%This program cannot be used without the prior approval of both Prof. Roberto Dugnani and the authors of the code.
%%------------------------------------------------------------------------------------------------------------------------------------------------
function [I] = morphchange(I1)
% function to do the morphological change
se90 = strel('line',5,90);
se0 = strel('line',5,0);
I_mask=imdilate(I1,[se90 se0]);
I_mask=imfill(I_mask,'holes');
seD = strel('diamond',1);
I_mask = imerode(I_mask,seD);
I_mask = imerode(I_mask,seD);
I_left=[];
for k=1:size(I1,1)
for j=1:70
I_left(k,j)=I_mask(k,j);
I_mask(k,j)=0;
end
end
for k=1:size(I1,1)
I_mask(1,k)=1;
I_mask(k,700)=1;
I_mask(700,k)=1;
end
I_mask=imfill(I_mask,'holes');
for k=1:size(I1,1)
    if I_mask(2,k)==0
I_mask(1,k)=0;
    end
    if I_mask(k,699)==0
I_mask(k,700)=0;
    end
    if I_mask(699,k)==0
I_mask(700,k)=0;
    end
end
for k=1:size(I1,1)
for j=1:70
    I_mask(k,j)=I_left(k,j);
end
end
I_top=[];
for k=1:size(I1,1)
for j=1:70
    I_top(j,k)=I_mask(j,k);
    I_mask(j,k)=0;
end
end
for k=1:size(I1,1)
I_mask(k,1)=1;
I_mask(700,k)=1;
I_mask(k,700)=1;
end
I_mask=imfill(I_mask,'holes');
for k=1:size(I1,1)
    if I_mask(k,2)==0
I_mask(k,1)=0;
    end
    if I_mask(699,k)==0
I_mask(700,k)=0;
    end
    if I_mask(k,699)==0
I_mask(k,700)=0;
    end
end
for k=1:size(I1,1)
for j=1:70
    I_mask(j,k)=I_top(j,k);
end
end
I=I_mask;
end