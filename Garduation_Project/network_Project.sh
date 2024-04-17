#!/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file
pcap_file="file.pcapng"
filter1='http'
filter2='arp'

# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Hint: Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    http_num=$(tshark -r "$pcap_file" -Y $filter1 | wc -l)
    arp_num=$(tshark -r "$pcap_file" -Y $filter2 | wc -l)

    total_packet_num=$(tshark -r "$pcap_file" -Y "$filter2 || $filter1" | wc -l)

    # extract IP addresses, and generate summary statistics.
    top_src_ips=$(tshark -r "$pcap_file" -Y "$filter2 || $filter1" -T fields -e ip.src | sort | uniq -c | sort -nr | head -n 5)
    top_dest_ips=$(tshark -r "$pcap_file" -Y "$filter2 || $filter1" -T fields -e ip.dst | sort | uniq -c | sort -nr | head -n 5)

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: $total_packet_num"
    echo "2. Protocols:"
    echo "   - HTTP: $http_num packets"
    echo "   - HTTPS/TLS: $arp_num packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    # Provide the top source IP addresses
    echo "$top_src_ips"
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    # Provide the top destination IP addresses
    echo "$top_dest_ips"
    echo ""
    echo "----- End of Report -----"
}



analyze_traffic