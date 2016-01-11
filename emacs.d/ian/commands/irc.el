(defun ian/erc-connect ()
  "Prompts for a channel, then connects to IRC."
  (interactive)
  (erc :server    "irc.freenode.net"
       :port      6667
       :nick      "matchbook"
       :password  erc-freenode-password
       :full-name "Ian Charles MacDonald"))
