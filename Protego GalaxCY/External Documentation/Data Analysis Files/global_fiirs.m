x = latitude;
y = longitude;

x_glob = [];
y_glob = [];
for i=1:length(x)
    if x(i) > 30
        if x(i) < 40
            if y(i) > 30
                if y(i) < 40
                    x_glob = [x_glob x(i)];
                    y_glob = [y_glob y(i)];
                end
            end
        end
    end
end


csvwrite('x_glob.csv', x_glob);
csvwrite('y_glob.csv', y_glob);