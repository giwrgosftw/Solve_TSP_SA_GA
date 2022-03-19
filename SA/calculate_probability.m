function p = calculate_probability(e, e_new, tNow)
    if e_new < e
        p = 1;
    else
        p = exp((e - e_new)/tNow);
    end
end