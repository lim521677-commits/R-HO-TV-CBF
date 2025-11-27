clear global OBS1_data_all OBS2_data_all OBS3_data_all OBS4_data_all OBS5_data_all OBS6_data_all


% 
t_data   = logsout.getElement('ox1').Values.Time;

ox1_data = logsout.getElement('ox1').Values.Data;
oy1_data = logsout.getElement('oy1').Values.Data;
oz1_data = logsout.getElement('oz1').Values.Data;
r1_data = logsout.getElement('r1').Values.Data;
state1_data=logsout.getElement('state1').Values.Data;

ox2_data = logsout.getElement('ox2').Values.Data;
oy2_data = logsout.getElement('oy2').Values.Data;
oz2_data = logsout.getElement('oz2').Values.Data;
r2_data = logsout.getElement('r2').Values.Data;
state2_data=logsout.getElement('state2').Values.Data;

ox3_data = logsout.getElement('ox3').Values.Data;
oy3_data = logsout.getElement('oy3').Values.Data;
oz3_data = logsout.getElement('oz3').Values.Data;
r3_data = logsout.getElement('r3').Values.Data;
state3_data=logsout.getElement('state3').Values.Data;

ox4_data = logsout.getElement('ox4').Values.Data;
oy4_data = logsout.getElement('oy4').Values.Data;
oz4_data = logsout.getElement('oz4').Values.Data;
r4_data = logsout.getElement('r4').Values.Data;
state4_data=logsout.getElement('state4').Values.Data;

ox5_data = logsout.getElement('ox5').Values.Data;
oy5_data = logsout.getElement('oy5').Values.Data;
oz5_data = logsout.getElement('oz5').Values.Data;
r5_data = logsout.getElement('r5').Values.Data;
state5_data=logsout.getElement('state5').Values.Data;

ox6_data = logsout.getElement('ox6').Values.Data;
oy6_data = logsout.getElement('oy6').Values.Data;
oz6_data = logsout.getElement('oz6').Values.Data;
r6_data = logsout.getElement('r6').Values.Data;
state6_data=logsout.getElement('state6').Values.Data;

% 
OBS1_current = [t_data, ox1_data, oy1_data, oz1_data,r1_data,state1_data];
OBS2_current = [t_data, ox2_data, oy2_data, oz2_data,r2_data,state2_data];
OBS3_current = [t_data, ox3_data, oy3_data, oz3_data,r3_data,state3_data];
OBS4_current = [t_data, ox4_data, oy4_data, oz4_data,r4_data,state4_data];
OBS5_current = [t_data, ox5_data, oy5_data, oz5_data,r5_data,state5_data];
OBS6_current = [t_data, ox6_data, oy6_data, oz6_data,r6_data,state6_data];
% 
global OBS1_data_all OBS2_data_all OBS3_data_all OBS4_data_all OBS5_data_all OBS6_data_all

if isempty(OBS1_data_all); OBS1_data_all = {}; end
if isempty(OBS2_data_all); OBS2_data_all = {}; end
if isempty(OBS3_data_all); OBS3_data_all = {}; end
if isempty(OBS4_data_all); OBS4_data_all = {}; end
if isempty(OBS5_data_all); OBS5_data_all = {}; end
if isempty(OBS6_data_all); OBS6_data_all = {}; end

OBS1_data_all{end+1} = OBS1_current;
OBS2_data_all{end+1} = OBS2_current;
OBS3_data_all{end+1} = OBS3_current;
OBS4_data_all{end+1} = OBS4_current;
OBS5_data_all{end+1} = OBS5_current;
OBS6_data_all{end+1} = OBS6_current;

% 
save('Obstacle_data_all.mat', 'OBS1_data_all', 'OBS2_data_all', 'OBS3_data_all','OBS4_data_all','OBS5_data_all','OBS6_data_all');

% 
fprintf('save：%d, length：%dx%d（含时间序列）\n',...
    length(OBS1_data_all),size(OBS1_data_all,1), size(OBS1_data_all,2));
disp(OBS1_data_all);



