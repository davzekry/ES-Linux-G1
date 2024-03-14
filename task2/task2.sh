#!/usr/bin/bash 

source config.sh

function Process_info() {
    declare process
    process=$1
    ps aux | grep $process
    #ps -eo euser,pid,ppid,pcpu,vsz| grep $process
}


# declare rr

# read -p "text: " rr

# echo "$rr"



main() {
    
    declare choice
    top -i -n 2

    declare State="y"

    while [[ $State == "y" ]]; do
        
        
        select choice in 'Process Information' 'kill Process' 'Processe Status' 'Real-time Monitoring' 'Search and Filter'; do 
            
            declare id

            case "${choice}" in
                'Process Information')
                    
                    read -p "Enter Keyword: " id
                    Process_info "$id" 
                    
                ;;
                'kill Process')
                    
                    read -p "Enter Process id: " id
                    kill -ABRT id

                ;;
                'Processe Status')

                    read -p "Enter Process id: " id
                    processName=$(ps -p "${id}" -o comm=)
                    echo "$processName"                

                ;;
                'Real-time Monitoring')

                    top -n "$intervals"

                ;;
                'Search and Filter')
                    
                    read -p "Enter your Search Keyword: " id
                    top -o id

                ;;
                # 'Interactive Mode')

                #     printf "\n Press the h key for more options \n"
                #     top

                # ;;
                'Resource Usage Alerts')

                #####

                ;;

                *)
                    echo "default (none of above)"
                ;;
            esac
            
            break
        done

        read -p "Do you want to continue?(y , n)" State

        if [ $State == "n" ]; then
            break
        fi
        
    done
}

main

# if [ "$choice" == "Process Information" ]; then
            
#     read -p "Enter Keyword: " id
#     Process_info "$id"
    
# elif [ "$choice" == "kill Process" ]; then
    
#     read -p "Enter Keyword: " id
#     kill id

# elif [ "$choice" == "Processe Status" ]; then
    
#     top

# elif [ "$choice" == "Real-time Monitoring" ]; then

#     while [ true ]; do
#         time
#         sleep 3
#     done
    

# elif [ "$choice" == "Search and Filter" ]; then

# elif [ "$choice" == "Interactive Mode" ]; then

# elif [ "$choice" == "Resource Usage Alerts" ]; then

# elif [ "$choice" == "Logging" ]; then

# elif [ "$choice" == "Configuration Options" ]; then


# fi