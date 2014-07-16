function radius = CoveringRadius(grad)
% calculate the covering radius of the given samples
%
% INPUT
%    grad     :  Nx3 matrix, each row is a point in sphere.
%
%
% OUTPUT
%    radius   :  covering radius, i.e., the minimal spherical distance between any two samples.
%
% Copyright (c) 2014, Jian Cheng <jian.cheng.1983@gmail.com>
%

%%
distAll = acos(abs(grad*grad'));
radius = min(distAll(triu(distAll,1)>0));

