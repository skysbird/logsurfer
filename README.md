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

**State chart in example above**

![state chart](https://raw.github.com/skysbird/logsurfer/master/fsm.png)


Log file content like this:

<pre>
[2013-02-01 15:33:16,262: DEBUG] Incoming msg=(<erl-binary: size=5>, <erl-atom: 'ss@127.0.0.1'>, <erl-binary: size=12>) (k=(), kw={})
[2013-02-01 15:33:16,263: ERROR] Traceback (most recent call last):
  File "/home/x/app/mt4client/trunk/process_node.py", line 147, in __TestMBoxCallback
    process_protocol(data,node,socket_id)
  File "/home/x/app/mt4client/trunk/process_node.py", line 82, in process_protocol
    doc = etree.fromstring(data)
  File "/usr/lib64/python2.6/xml/etree/ElementTree.py", line 963, in XML
    parser.feed(text)
  File "/usr/lib64/python2.6/xml/etree/ElementTree.py", line 1245, in feed
    self._parser.Parse(data, 0)
ExpatError: syntax error: line 1, column 0

[2013-02-01 15:33:19,299: DEBUG] Incoming msg=(<erl-binary: size=1236>, <erl-atom: 'ss@127.0.0.1'>, <erl-binary: size=11>) (k=(), kw={})
[2013-02-01 15:33:19,317: DEBUG] **************************update order start******************************
[2013-02-01 15:33:19,781: DEBUG] Incoming msg=(<erl-binary: size=303>, <erl-atom: 'ss@127.0.0.1'>, <erl-binary: size=11>) (k=(), kw={})
[2013-02-01 15:33:19,812: DEBUG] Incoming msg=(<erl-binary: size=299>, <erl-atom: 'ss@127.0.0.1'>, <erl-binary: size=11>) (k=(), kw={})
[2013-02-01 15:33:19,824: INFO] <?xml version="1.0" encoding="UTF-8"?><package uid="2506"><response type="ping" refid="894641" id="130041776018171250"><equity>5089953.01000000</equity><balance>5089953.01000000</balance><margin>0.00000000</margin><freeMargin>5089953.01000000</freeMargin><profit>0.00000000</profit></response></package>

</pre>

Logsurfer will output:

<pre>
[2013-02-01 15:33:16,263: ERROR] Traceback (most recent call last):
  File "/home/x/app/mt4client/trunk/process_node.py", line 147, in __TestMBoxCallback
    process_protocol(data,node,socket_id)
  File "/home/x/app/mt4client/trunk/process_node.py", line 82, in process_protocol
    doc = etree.fromstring(data)
  File "/usr/lib64/python2.6/xml/etree/ElementTree.py", line 963, in XML
    parser.feed(text)
  File "/usr/lib64/python2.6/xml/etree/ElementTree.py", line 1245, in feed
    self._parser.Parse(data, 0)
ExpatError: syntax error: line 1, column 0

</pre>