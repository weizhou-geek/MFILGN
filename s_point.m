function spoint=s_point(m,n,sampling_interval)

column_num=m/sampling_interval;     %sampling on the latitudes
sampling_degree=180/(column_num);   %sampling degree
spoint=[0 -90];                     %south pole
%sampling on the longitudes
for i=-m/(2*sampling_interval):m/(2*sampling_interval)
    theta=i*sampling_degree;
    point_latitude_temp=theta;                       
    circle_length=n*cos(theta*pi/180);
    row_num=circle_length/sampling_interval;
    point_longitude_temp=linspace(-180,180,row_num+1);
    point_longitude=point_longitude_temp(1:end-1);    
    point_latitude=repmat(point_latitude_temp,length(point_longitude),1);
    spoint=[spoint;point_longitude' point_latitude];
end
spoint=[spoint;0 90];               %north pole