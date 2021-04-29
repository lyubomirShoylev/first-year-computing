for x=rand(1,10)
      if x>=0.5
        continue
      end
    disp(['We should only see x = ', num2str(x), ' values below a half']);
end