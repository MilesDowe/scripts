$diary="C:\Users\Miles\Documents\writing\diary_and_blogs\$(date +%Y%m%d)_log.md"


echo "## $(date +%H:%M:%S)" >> $diary
gvim $diary +ProseOn
