;; Time-stamp: <2009-08-04 10:54:07 >
;; Started with noufal's .emacs

;; First, our paths.
(add-to-list 'load-path "/usr/share/emacs-snapshot/site-lisp/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; CEDET setup
(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ECB setup
(require 'ecb)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(require 'mwheel)

;; EMacs git interfaces
(require 'magit)

;; Imenu is necessary to get which-function-mode to work fine. 
(require 'imenu)
(which-function-mode 1)

;; Auto cleanup of operators
;;(require 'smart-operator)

;; Enable font locking for all modes
(global-font-lock-mode t)

;; Show sexp parents in all modes. 
(show-paren-mode t)

;; Enable transient-mark-mode
(transient-mark-mode t)

;; Remove tooltips (colour issues on 8 bit X).
(tooltip-mode -1)

;; Prevent lisp debugger from popping up when mistakes are made. 
 (setq eval-expression-debug-on-error nil)
 (setq debug-on-error nil)

;; I don't want backup files. 
(setq make-backup-files nil)

;; Indent data for XML documents. 
(setq sgml-indent-data t)		

;; Enable mouse-avoidance-mode
(mouse-avoidance-mode 'cat-and-mouse)

;; Enable unique buffer names
(toggle-uniquify-buffer-names)

;; Enable line-number-mode.
(line-number-mode 1)

;; Enable column number mode.
(column-number-mode 1)

;; Enable auto-fill-mode
(auto-fill-mode )

;; Enable c warning mode
(global-cwarn-mode 1)

;; Lose the tool bar
(tool-bar-mode -1)

(require 'ido)
(ido-mode t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; A saner prefix for outline-minor-mode
(setq outline-minor-mode-prefix "\C-c")


;; Org mode :)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(autoload 'org-remember-annotation "org")
(autoload 'org-remember-handler "org")
(setq org-directory "~/org")
(setq org-default-notes-file "~/notes/notes.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(setq org-todo-keywords '("TODO" "FEEDBACK" "VERIFY" "DONE")
      org-todo-interpretation 'sequence)
(setq org-log-done t)
;; Useful keybindings
(global-set-key "\C-\M-y"                                  
         (lambda () (interactive )(popup-menu 'yank-menu)))
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>")  'shrink-window)

(global-set-key [f1] (lambda () (interactive) (delete-other-windows) (switch-to-buffer "*Group*")))
(global-set-key [f2] (lambda () (interactive) (find-file "~/.notes")))
(global-set-key [f3] 'erc-track-switch-buffer)
(global-set-key [f4] (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key [f5] (lambda () (interactive) (find-file "~/story.txt")))
(global-set-key [f6] (lambda () (interactive) (find-file "~/projects/Lisp/crypt.el")))
(global-set-key [f7] (lambda () (interactive) (message (buffer-file-name))))
(global-set-key [f8] 'delete-frame)
(global-set-key (kbd "M-RET") (lambda () (interactive) (find-file "~/hacking/perl/trial0.pl") (cperl-mode)))
(global-set-key (kbd "<prior>") (lambda () (interactive) (goto-char (window-start))))
(global-set-key (kbd "<next>") (lambda () (interactive) (goto-char (- (window-end) 1))))
(global-set-key [S-mouse-3] 'imenu)
;; (global-set-key "\C-x\C-m" 'execute-extended-command)
;; (global-set-key "\C-c\C-m" 'execute-extended-command)


;; (require 'tramp)

(require 'cperl-mode)
;;(require 'javascript-mode)
;; (require 'perldoc)
;; (defalias 'perl-mode 'cperl-mode)
(define-key cperl-mode-map (kbd "C-c C-c") '(lambda ()
					      (interactive)
					      (shell-command (buffer-file-name))))

(define-key cperl-mode-map (kbd "C-c C-q") 'tc_comment)
(define-key cperl-mode-map (kbd "C-c C-a") 'tc_print)
(define-key cperl-mode-map (kbd "C-c C-d") 'imenu)

;; (define-key cperl-mode-map (kbd "C-c C-x") '(lambda ()
;; 			   (interactive)
;; 			   (perldoc (thing-at-point 'filename))))


;; (setq cperl-mode-hook 'nil)


(require 'python-mode)


;; (add-hook 'python-mode-hook (lambda () (interactive) 
;;                               (progn
;;                                 (define-key py-mode-map (kbd "M-]") 'imenu)
;;                                 (pymacs-load "bikeemacs" "brm-")
;;                                 (brm-init))))


(add-hook 'cperl-mode-hook (lambda () (interactive) (which-func-mode 1)))


;; Don't disable these commands.
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; iswitch mode is a lot more useful
(require 'iswitchb)
(iswitchb-mode)
(icomplete-mode t)


;; Mode hooks which I use
;; Automatically time-stamp files when they are saved. 
(add-hook 'write-file-hooks 'time-stamp)
;; Lose the camel caps for the wiki mode
;(add-hook 'emacs-wiki-mode-hook 'glasses-mode)
;; Auto-filling for the diary, fundamental and text modes. 
(add-hook 'diary-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'fundamental-mode-hook 'auto-fill-mode)

;; Automatically correct spellings.
(setq flyspell-incorrect-hook '(flyspell-maybe-correct-transposition))

;; To enable python mode with .py files. It should happen by default. :-/
;;(add-to-list 'auto-mode-alist '("\\.py" . python-mode))
(add-to-list 'auto-mode-alist '("\\.yp" . cperl-mode))


;; Global settings
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list (quote ("/usr/local/emacs_unicode/info/")))
 '(auto-save-default nil)
 '(backup-directory-alist (quote ((".*" . "~/backups/"))))
 '(bbdb-electric-p t)
 '(bbdb/gnus-lines-and-from-length 5)
 '(calendar-longitude -121.8587)
 '(canlock-password "c7ef5f1a56c643baf2bfc2863cc57eaed1cc42e8")
 '(cperl-clobber-lisp-bindings t)
 '(cperl-electric-linefeed t)
 '(cperl-electric-parens-mark nil)
 '(cperl-hairy nil)
 '(cperl-syntaxify-by-font-lock nil)
 '(cperl-under-as-char t)
 '(diary-file "~/writings/diary")
 '(dictionary-create-buttons t)
 '(dictionary-use-single-buffer t)
 '(ecb-layout-window-sizes (quote (("left8" (0.25161290322580643 . 0.2807017543859649) (0.25161290322580643 . 0.24561403508771928) (0.25161290322580643 . 0.2807017543859649) (0.25161290322580643 . 0.17543859649122806)))))
 '(ecb-options-version "2.21")
 '(ediff-custom-diff-options "-c -w")
 '(erc-modules (quote (autojoin bbdb button fill irccontrols netsplit noncommands pcomplete completion ring track)))
 '(eshell-modules-list (quote (eshell-alias eshell-banner eshell-basic eshell-cmpl eshell-dirs eshell-glob eshell-hist eshell-ls eshell-pred eshell-prompt eshell-script eshell-smart eshell-term eshell-unix)))
 '(eshell-visual-commands (quote ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm" "ssh" "rlogin" "rsh")))
 '(flyspell-default-dictionary "british")
 '(font-lock-support-mode (quote jit-lock-mode))
 '(gnus-extra-headers (quote (To X-Mailer)))
 '(gnuserv-frame t)
 '(gnuserv-program "/usr/bin/gnuserv")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(iswitchb-buffer-ignore (quote ("^ " "*Buffer" "KILL" "*Compile-Log*" "BBDB")))
 '(iswitchb-case nil)
 '(load-home-init-file t t)
 '(lpr-command "lpr")
 '(mail-source-delete-incoming nil)
 '(mail-source-delete-old-incoming-confirm nil)
 '(make-backup-files nil)
 '(menu-bar-mode t nil (menu-bar))
 '(message-kill-buffer-on-exit t)
 '(message-mode-hook (quote (turn-on-orgtbl my-message-mode-setup paragraph-indent-minor-mode)))
 '(mm-inline-text-html-with-images t)
 '(mouse-wheel-mode t nil (mwheel))
 '(nnmail-treat-duplicates (quote warn))
 '(partial-completion-mode nil)
 '(planner-carry-tasks-forward t)
 '(printer-name "cbin3-prn6b")
 '(ps-lpr-command "lpr")
 '(ps-printer-name "cbin3-prn6b")
 '(ps-printer-name-option "-P")
 '(py-imenu-show-method-args-p t)
 '(quack-default-program "guile")
 '(query-user-mail-address nil)
 '(rcirc-default-nick "Khmar")
 '(rcirc-fill-column (quote frame-width))
 '(rcirc-fill-flag nil)
 '(sentence-end-double-space t)
 '(show-trailing-whitespace nil)
 '(smtpmail-debug-info nil)
 '(speedbar-tag-split-minimum-length 50)
 '(undo-limit 40000)
 '(user-mail-address "sivakumar.krishnamurthy@mkhoj.com")
 '(woman-cache-filename "~/.wmncach.el")
 '(woman-cache-level 2)
 '(woman-imenu t)
 '(woman-use-own-frame nil))

;;Windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(require 'font-lock)

;;Emacs Applications

;;Other extensions
(require 'dired)
(require 'ibuffer)


;;Smaller functions
;;(load-file "~/local-lisp/rect-mark-init.elc") ;Rectangular highlighting 
                                              ;for transient-mark-mode
;;(load-file "~/local-lisp/ascii.elc")          ;Ascii table. 
;;(load-file "~/local-lisp/h4x0r.elc")          ;w00t!!! :)
;; (load-file "~/local-lisp/match-paren.elc")    ;Vi style paren jumping
;;(load-file "~/local-lisp/misc-nkv.el")           ;Miscellaneous functions
;;(load-file "~/local-lisp/browse-kill-ring.elc") ; M$ office clipboard :)

(setq eval-expression-print-length 150) ;; Prevents emacs-lisp mode fro
                                        ;; truncating too early. 

(setq truncate-partial-width-windows nil)

(add-to-list 'default-frame-alist
	     '(background-color . "black"))


(add-to-list 'default-frame-alist
	     '(foreground-color . "wheat"))

(add-to-list 'default-frame-alist
	     '(foreground-color . "wheat"))

;; (add-to-list 'default-frame-alist
;; 	     '(font . "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

;;(add-to-list 'default-frame-alist
;;	     '(font . "-unknown-Liberation Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))



(require 'generic-x)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((((class color) (background dark)) (:foreground "darkred"))))
 '(gnus-group-mail-3-empty ((((class color) (background dark)) (:foreground "aquamarine4" :weight light))))
 '(highlight ((((class color) (background dark)) (:background "grey40"))))
 '(mmm-code-submode-face ((t (:background "DarkSlateGrey" :foreground "Wheat"))))
 '(mmm-default-submode-face ((t nil)))
 '(org-level-4 ((t (:inherit outline-4 :foreground "blue"))))
 '(tabbar-default-face ((t (:inherit variable-pitch :background "gray72" :foreground "gray60" :weight light :height 0.8 :family "fixed"))))
 '(tooltip ((((class color)) (:background "yellow" :foreground "black")))))


(set-foreground-color "wheat")
(set-background-color "black")
(set-cursor-color "orchid")

;; (setq socks-noproxy '("localhost"))
;; (setq socks-override-functions t)
;; (require 'socks)
;; (defalias 'open-network-stream 'socks-open-network-stream)


(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))

(global-set-key (kbd "C-x k") 'volatile-kill-buffer)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)



(defun tc_comment (str p m)
  "Add a special comment for tc_cleanup files."
  (interactive "MComment: \nr")
  (save-excursion
    (goto-char p)
    (insert (concat "\n## TC_CLEANUP [Begin] :: " str "\n"))
    (let (
          (n (+ m (length str) 27))
          )
      (goto-char n)
      (insert (concat "\n## TC_CLEANUP [End] :: " str "\n")))))

(defvar tc_prefix "***")

(defun tc_check_and_add_logger () 
  (save-excursion
    (save-restriction 
      (narrow-to-defun)
      (if (not (string-match "\\$logger = get_logger" (buffer-string)))
          (progn
            (goto-char (point-min))
            (forward-line 2)
            (insert "my $logger = get_logger(\"DriverCov\");\n")
            (forward-line -1)
            (cperl-indent-command)))
      )))

(defun tc_print (str)
  "Add a logger debug message. Inserts the get_logger into the current function if it's not there."
  (interactive "MString: ")
  (tc_check_and_add_logger)
  (insert (concat "$logger->debug(\"" str "\");\n"))
  (forward-line -1)
  (cperl-indent-command)
  (forward-line 1))



(defun nkv-notes-switch ()
  (interactive)
  (if (eq (current-buffer) (get-buffer-create "*notes*"))
      (switch-to-buffer last-buffer)
    (progn 
      (setq last-buffer (current-buffer))
      (switch-to-buffer (get-buffer "*notes*")))))
(global-set-key (kbd "C-c C-SPC") 'nkv-notes-switch)

(setq browse-url-browser-function 'browse-url-firefox)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(require 'ange-ftp)

;;(load-file "~/local-lisp/python-outline.el")

(put 'scroll-left 'disabled nil)
(defun nkv-message-insert-headers  ()
  (interactive)
  (insert "To: 
Subject: 
--text follows this line--
-=-=-=-=-=-=-=-=-=# Don't remove this line #=-=-=-=-=-=-=-=-=-



"))

;;(require 'paredit)
;;(require 'htmlize)

(global-set-key (kbd "M-g M-g") 'goto-line)

(defun chime-grant ()
  (interactive)
  (gnus-summary-select-article-buffer)
  (save-excursion
    (search-forward ": requested")
    (beginning-of-line)
    (let ((beg (1- (point))))
      (search-forward ":")
      (backward-char 2)
      (setq stream (substring (buffer-string) beg (point))))
    (gnus-summary-followup 'nil)
    (insert (concat "grant:" stream))
    (message-send-and-exit)
    )
  )

(defun org-dblock-write:block-changelog (f)
  (save-excursion
    (insert (shell-command-to-string (concat "git log --pretty='format:|%ad|%s|' " (buffer-file-name))))
    (forward-line -1)
    (org-table-align)
    ))

(setq org-hide-leading-stars t)

(add-hook 'write-file-hooks 'org-update-all-dblocks)

(fset 'sdpm-summary
   [?* ?* ?\S-  ?S ?D ?P ?M ?\S-  ?S ?1 ?, ?  ?S ?2 ?, ?  ?S ?5 ?  ?a ?n ?d ?  ?G ?4 ?  ?n ?u ?m ?b ?e ?r ?s ?  ?f ?o ?r ?  ?\C-c ?! return return ?* ?* ?* ?\S-  ?S ?u ?m ?m ?a ?r ?y return ?| ?\S-  ?M ?e ?t ?r ?i ?c ?  ?| ?\S-  ?A ?c ?t ?u ?a ?l ?  ?\( ?m ?i ?n ?u ?t ?e ?s ?\) ?\S-  ?| ?\S-  ?G ?i ?v ?e ?n ?  ?t ?o ?  ?c ?o ?r ?p ?o ?r ?a ?t ?e ?| ?\C-a ?\C-f ?\C-c ?- ?\C-/ tab tab ?\C-e ?\C-b tab ?\C-p ?\C-c ?- ?\C-n ?\C-n ?S ?1 tab tab ?3 tab ?@ backspace ?S ?2 tab tab ?6 ?0 tab tab ?@ ?5 tab tab S-iso-lefttab S-iso-lefttab ?\C-d ?S tab tab ?2 ?7 ?0 tab ?G ?4 tab tab ?2 ?6 tab ?\C-a ?\C-k ?* ?* ?\S-  ?N ?o ?t ?e ?s ?  ?a ?\C-a ?* ?\C-e ?n ?d ?  ?u ?p ?d ?a ?t ?e ?s return])

(add-hook 'org-mode-hook (lambda ()
                           (interactive)
                           (local-set-key (kbd "C-c C-i")
                                          'sdpm-summary)))


(fset 'nkv-org-insert-python-source-block
   [?# ?+ ?B ?E ?G ?I ?N ?\) ?S ?R backspace backspace ?_ backspace backspace ?_ ?S ?R ?C ?  ?p ?y ?t ?h ?o ?n return return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C ?\C-p])

(add-hook 'org-mode-hook 
	  (lambda () (define-key org-mode-map "\C-ci" 'nkv-org-insert-python-source-block)))




(server-start)

(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

