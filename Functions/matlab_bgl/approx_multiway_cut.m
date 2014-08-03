function C = approx_multiway_cut(A,vs)
if (~isequal(A,A'))
    error('approx_multiway_cut:invalidParameter', ...
        'the matrix must be symmetric.');
end;

if (min(min(A)) < 0)
    error('approx_multiway_cut:invalidParameter', ...
        'the matrix cannot contain negative wieghts.');
end;

n = size(A,1);

int_infinity = sum(sum(A))+2*sum(sum(A(vs,:)))+1;

C = sparse(n,n);
[i j v] = find(A);

for (kk=1:length(vs))
    v = vs(kk);
    others = setdiff(vs,v);
    
    Aflow = A;
    Aflow(others,n+1) = int_infinity*ones(length(others),1);
    Aflow(n+1,:) = sparse(n+1,1);
    
    [flow ci] = max_flow(Aflow,v,n+1);
    
    ci = ci(1:end-1);
    
    vc = abs(v.*(ci(i)-ci(j)))./2;
    
    C = C + sparse(i,j,vc,n,n);
end;
