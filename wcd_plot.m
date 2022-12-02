% WCD_PLOT will show the yield(y)-performance(p) graph and calculate the WCD.
% y and p are both vectors with the same dimension.
function wcd = wcd_plot(p, y ,freq_ix, y_thres, isplot)

wcd = 0;

p_fit = p(y>=y_thres);
y_fit = y(y>=y_thres);

mu_p_fit = mean( p_fit );
max_p_fit = max( p_fit );
min_p_fit = min( p_fit );
range_y_fit = max( y_fit ) - min( y_fit );
wcd = min( max_p_fit-mu_p_fit, mu_p_fit-min_p_fit );


if isplot
    % Color the area within wcd
    area_x = [mu_p_fit-wcd,mu_p_fit+wcd];
    area_y = [max(y), max(y)];
    area( area_x, area_y, y_thres,'FaceColor','#C0C0C0')
    hold on;

    % Plot dots lower than threshold
    plot(p(y<y_thres) , y(y<y_thres), 'k.')
    % Plot dots over threshold
    plot(p_fit, y_fit, 'r.')

    % Plot the verticle mu line
    plot([mu_p_fit, mu_p_fit], [min(y),max(y)],'b')
    % Plot the verticle line, lower wcd bound
    plot([mu_p_fit-wcd,mu_p_fit-wcd] , [min(y),max(y)], 'r')
    % Plot the verticle line, upper wcd bound
    plot([mu_p_fit+wcd,mu_p_fit+wcd], [min(y),max(y)], 'r')
    hold off;
end






end