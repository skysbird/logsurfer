logsurfer
=========

<big>**The source project is at**</big>

http://www.crypt.gen.nz/logsurfer/

<big>**The Official Document is at**</big>

http://www.crypt.gen.nz/logsurfer/#documentation

<big>**Changes:</big>**

**Added the Finate Machine State Support, so the configuration file has some change.**

		state1 "ERROR" - - - 0 state2 continue ignore
		state2	"INFO|DEBUG|WARNING" - - - 0 state3 continue report  "/bin/mail -s 'alert_from_process_node.log' neal@xinwaihui.com,zhangce@xinwaihui.com" ".*"
		state2 	".*" - - - 0 state2 continue  open ".*" "INFO|DEBUG|WARNING" 100 - 100  state1 report  "/bin/mail -s 'alert_from_process_node.log' neal@xinwaihui.com,zhangce@xinwaihui.com" ".*"
		state3	"INFO|DEBUG|WARNING" - - - 0 state1 continue delete ".*"



**Changes in Configuration**

- In official project:

	The basic format of a rule definition is:

		match_regex not_match_regex stop_regex not_stop_regex timeout [continue] action

	Contexts have the following format:

		match_regex match_not_regex line_limit timeout_abs timeout_rel [min_lines] default_action



- In this project:
	
	The format of a rule defination changes:

		from_state match_regex not_match_regex stop_regex not_stop_regex to_state timeout [continue] action


          The new configuration add two params: from_state and to_state:

          from_state: this rule will only enable on this state;

          to_state: when this rule action finished the state will transit to to_state.

	Contexts defination changes:

	   	match_regex match_not_regex line_limit timeout_abs timeout_rel [min_lines] to_state default_action


	 The new configuration add two params: from_state and to_state:

            to_state: when this rule action finished the state will transit to to_state.

