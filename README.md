logsurfer
=========

The source project is at
http://www.crypt.gen.nz/logsurfer/

The Official Document is at
http://www.crypt.gen.nz/logsurfer/#documentation

Changes:

Added the Finate Machine State Support, so the configuration file has some change.

		state1 "ERROR" - - - 0 state2 continue ignore
		state2	"INFO|DEBUG|WARNING" - - - 0 state3 continue report  "/bin/mail -s 'alert_from_process_node.log' neal@xinwaihui.com,zhangce@xinwaihui.com" ".*"
		state2 	".*" - - - 0 state2 continue  open ".*" "INFO|DEBUG|WARNING" 100 - 100  state1 report  "/bin/mail -s 'alert_from_process_node.log' neal@xinwaihui.com,zhangce@xinwaihui.com" ".*"
		state3	"INFO|DEBUG|WARNING" - - - 0 state1 continue delete ".*"



