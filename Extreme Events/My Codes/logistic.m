function out = logistic(x, r)
    dim = size(x);
    out = r .*x .*(1 - x);
end