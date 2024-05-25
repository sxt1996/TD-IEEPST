  function  [result_2D] = TD_IEEPST(X_cube,target,N_topo,per_ie)
% paper:¡¶A Point-Set Topology Based Information Entropy Estimation Method for Hyperspectral Target Detection¡·
% Input:
% X_cube: an HSI being processed;  
% N_topo: the number of point sets in each topological space; per_ie: the percentage used to set the threshold to constrain the information entropy
% Output:
% result_2D: detection results

 
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 
clear('X_cube', 'X_use');

%% Construct parallel topological spaces
[chessboard_card, chessboard_cenvalue] = hist(X.', N_topo);
chessboard_card = chessboard_card.';
chessboard_cenvalue = chessboard_cenvalue.';
chessboard_cenvalue = repmat(chessboard_cenvalue,band_num,1);
    
    
%% Sleect the optimal separable spaces    
    
    target_card_set = [];
    target_index_set = [];
    distance_on_chessboard_ave = [];
    distance_on_chessboard_max = [];
    cardinality_share_on_chessboard_ave = [];
    
    for j = 1:band_num    
        t = target(j);
        chessboard_card_j = chessboard_card(j,:);
        
        
        
        X_dim_cen_j = chessboard_cenvalue(j,:);
     

        
        [~, index_target] = min(abs(X_dim_cen_j(:) - t));
        target_index_set = [target_index_set; index_target];   
        target_j_cardinality = chessboard_card(j, index_target);   
        if target_j_cardinality == 0      
            target_j_cardinality = 1;     
        end 
        target_card_set = [target_card_set, target_j_cardinality/pixel_num];
             
       
    end

    
    information_entropy_target = - target_card_set.*log(target_card_set) -(1-target_card_set).*log(1-target_card_set);    
    information_entropy_interval = max(information_entropy_target) - min(information_entropy_target);
    threshold_allbands = min(information_entropy_target) + per_ie * information_entropy_interval;   
    index_for_AS_information_entropy_use_1 = find( information_entropy_target < threshold_allbands );   
    index_for_AS_information_entropy_use_2 = find( information_entropy_target > 0 );   
    OSS = intersect(index_for_AS_information_entropy_use_1, index_for_AS_information_entropy_use_2);   


    N_OSS = length(OSS);    
     
    target_index_set_oss = target_index_set(OSS);    
    target_card_set_oss = target_card_set(OSS);    


%% Perform target detection 
result = zeros(1, pixel_num);


for i = 1:pixel_num
    x = X(:,i);   
    x_card_set_oss = [];
    cardinality_share_in_oss = [];
    for j = 1:N_OSS       
        
        k = OSS(j);      
        a = x(k);          
        chessboard_card_k = chessboard_card(k,:);
               
        X_dim_cen_k = chessboard_cenvalue(k,:);     
        [~, index_x_oss] = min(abs(X_dim_cen_k(:) - a));   
 
 
        
            index_t_oss  = target_index_set_oss(j);
        
           if index_x_oss >= index_t_oss
               cardinality_share_in_OSS_k = sum(chessboard_card(k, index_t_oss:index_x_oss ));    
           else
               cardinality_share_in_OSS_k = sum(chessboard_card(k, index_x_oss:index_t_oss));
           end
       
       cardinality_share_in_oss = [cardinality_share_in_oss; cardinality_share_in_OSS_k/pixel_num];   
                  
    end
    

    score = mean(cardinality_share_in_oss);
    
    result(i) = exp(- score);
        
end

r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines);     
         
end   


    
     




