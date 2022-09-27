[nms]
%{ for ip in nginx_mgmt ~}
${ip}
%{ endfor ~}

[nginx_data_plane]
%{ for ip in nginx_data_plane ~}
${ip}
%{ endfor ~}

[nginx_dev_portal]
%{ for ip in nginx_dev_portal ~}
${ip}
%{ endfor ~}
