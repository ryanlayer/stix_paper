paste <(paste \
    <(cat 1kg/1kg.DEL.stix_stats | awk '{print $1,$2;}') \
    <(cat 1kg/1kg.DUP.stix_stats | awk '{print $2;}') ) \
    <(cat 1kg/1kg.INV.stix_stats | awk '{print $2;}') 
