(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("007b69ffec046a5842e34fea287b23c49175dfd6c6d5a0d9cdf150a2e8a8979f" default)))
 '(indicate-empty-lines t)
 '(scroll-bar-mode nil)
 '(show-paren-mode 1)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(display-time-mode t)

(set-default-font "Inconsolata-14") ;; working
;;(set-default-font "DejaVu Sans Mono")
;;(set-default-font "Terminus-14")
;;(set-default-font "Bitstream Vera Sans Mono")
;;(set-default-font "Monaco-11")

;;(set-face-attribute 'default nil :font "Bitstream Vera Sans Mono" :height 108)
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 120)
;;(set-face-attribute 'default nil :font "Inconsolata" :height 120)

;;http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;The value is in 1/10pt, so 100 will give you 10pt, etc. 
;;(set-face-attribute 'default nil :height 110)

;; make typing overwrite text selection
;; this turns on transient-mark-mode automatically
;;(setq delete-selection-mode 1)

;; highlight just parens
;;(setq show-paren-style 'parenthesis)
;; highlight entire expression
;;(setq show-paren-style 'expression) 


;; (require 'color-theme)
;; (load "/home/m/.emacs.d/myThemes/color-theme-tango.el")
;; (color-theme-tango)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn t)


(setq inhibit-splash-screen t)

;; for emacsclient
(server-start)

;; how long to wait?
(setq show-paren-delay 0)
;; highlight matching parenthesis 
(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; alternatives are 'expression' 'parenthesis' and 'mixed'


;; i had to use it as the compilation buffer
;; gave strange \260 and \261 symbols
(prefer-coding-system 'utf-8)


;; http://www.io.com/~jimm/emacs_tips.html#dabbrev-expand
(setq dabbrev-case--replace nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;http://trey-jackson.blogspot.com/2007/12/emacs-tip-5-hippie-expand.html
(global-set-key (kbd "M-/") 'hippie-expand)
;; hippie-expand-try-functions-list hippie-expand-try-functions-list
;; is a variable defined in `hippie-exp.el'.  Its value is
;; (try-complete-file-name-partially try-complete-file-name
;; try-expand-all-abbrevs try-expand-list try-expand-line
;; try-expand-dabbrev try-expand-dabbrev-all-buffers
;; try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially
;; try-complete-lisp-symbol)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
 try-expand-dabbrev-all-buffers try-expand-list try-expand-line
 try-expand-dabbrev-from-kill try-complete-file-name-partially
 try-complete-file-name try-expand-all-abbrevs
 try-complete-lisp-symbol-partially try-complete-lisp-symbol))


;;
;; compilation
;;
;; http://emacslife.blogspot.com/2009/02/compilation.html
(global-set-key [f11] 'compile)
(global-set-key [f12] 'recompile)
;;(setq compilation-scroll-output t)
;;http://www.dotfiles.com/files/6/362_init.el
;;(setq compilation-window-height 16)

(setq compile-command "make -k -r -j4" )

;;
;; make -r so that make does not use any built in rules
;; http://blog.electric-cloud.com/2009/08/19/makefile-performance-built-in-rules/
;;

;; http://www.emacswiki.org/emacs/CompileCommand#toc3
;;(setq compilation-read-command nil)


;;==================================================
;; http://www.bloomington.in.us/~brutt/emacs-c-dev.html
;;

;;(setq compilation-window-height 8)

(setq compilation-finish-function
      (lambda (buf str)
	(if (string-match "exited abnormally" str)

	    ;; there were errors
	    (message "compilation errors")

	  ;; no errors, make the compilation window go away in 1.0 seconds
	  (run-at-time 1.0 nil 'delete-windows-on buf)
	  (message "no compilation errors"))))



;;==================================================



;; http://eden.rutgers.edu/~mangesh/emacs.html
;; Frame title bar formatting to show full path of file
(setq-default
 frame-title-format
 (list '((buffer-file-name " %f" (dired-directory
	 			  dired-directory
				  (revert-buffer-function " %b"
                                                          ("%b - Dir:  " default-directory)))))))



;; http://eden.rutgers.edu/~mangesh/emacs.html
(setq-default
 icon-title-format
 (list '((buffer-file-name " %f" (dired-directory
                                  dired-directory
                                  (revert-buffer-function " %b"
                                                          ("%b - Dir:  " default-directory)))))))

;;http://eden.rutgers.edu/~mangesh/emacs.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cut and Paster
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; When I yank a piece of code ( known as paste in Windows lingo )
;; into an existing function, I like to have it indent itself to the
;; proper level automatically. This simple macro runs yank ( C-y )
;; followed by an indent current function. ( C-c C-q )
;;(global-set-key "\C-cy" 'do-smart-yank)
;;(fset 'do-smart-yank
;; "\C-y\C-c\C-q")


(add-to-list 'load-path "/usr/share/emacs/site-lisp/yas")
(add-to-list 'load-path "/home/m/.emacs.d/mySnippets")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "/usr/share/emacs/site-lisp/yas/snippets")
(yas/load-directory "/home/m/.emacs.d/mySnippets")

;; ;;http://code.google.com/p/yasnippet/
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (setq yas/trigger-key [(super tab)])
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")


;; (add-hook 'yas/after-exit-snippet-hook
;;           '(lambda ()
;;              (indent-region yas/snippet-beg
;;                             yas/snippet-end)))



;; http://trey-jackson.blogspot.com/2008/04/emacs-tip-16-flyspell-and-flyspell-prog.html
;; http://github.com/bbatsov/emacs/blob/8a25c4f8984bc6c89033ec984f7f81a97d8a717f/dot-emacs.el
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-common-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'c++-mode-hook 'turn-on-flyspell-prog-mode t)
(defun turn-on-flyspell ()
  "Force flyspell-mode on using a positive argument. For use in hooks."
  (interactive)
  (flyspell-mode 1))


;;http://zhangda.wordpress.com/2009/05/06/several-good-tips-on-emacs-from-emacs-fus-dot-emacs-trickery/
;; highlight the current line, as in Matlab
;;(global-hl-line-mode)
;;(set-face-background 'hl-line "blue")
;;(set-face-background 'hl-line "#330")
;;(set-face-background 'hl-line "#111") 


;;http://emacs-fu.blogspot.com/2009/05/remembering-your-position-in-file.html
(setq save-place-file ".emacs.d/saveplace")
(setq-default save-place t) ;; activate it for all buffers
(require 'saveplace)        ;; get the package


;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.

(setq auto-fill-mode 1)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)



;; ========== Set the fill column ==========

;; The fill column influences how Emacs justifies paragraphs. 
;; For best results choose a value less than 80: 
(setq-default fill-column 79)



;; the following will cause emacs to go into c++-mode when editing
;; header files ending in .h, before this emacs used to enter c-mode
;; when editing .h files.
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))

;; c++ template files
(setq auto-mode-alist (cons '("\\.tpp$" . c++-mode) auto-mode-alist))

(setq c++-mode-hook 'turn-on-auto-fill)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;==================================================


;; http://www.inference.phy.cam.ac.uk/cjb/dotfiles/dotemacs

;; Change "yes or no" prompts to "y or n" prompts.
(fset 'yes-or-no-p 'y-or-n-p)



;; http://www.djcbsoftware.nl/dot-emacs.html
(icomplete-mode t) ;; don't like it ... it's good for learning though


(setq c-hungry-delete-key t)



;; let emacs put in a return for you after left curly braces,
;; right curly braces, and semi-colons.
;; http://infolab.stanford.edu/~manku/emacs.html
;;(setq c-auto-newline 1)



;; (global-linum-mode 1)


(setq auto-mode-alist (cons '("\\.mk$" . makefile-mode) auto-mode-alist))


;; http://curiousprogrammer.wordpress.com/2009/07/13/my-emacs-defaults/
(require 'ido)
(ido-mode t)
(setq ;; 
 ido-enable-flex-matching t
 ;; case insensitive
 ido-case-fold t)
;; the following is helpful when creating new buffers
(setq ido-create-new-buffer 'always)


;; make it so that when I copy a region, that gets sent to the OS clipboard.
;; http://curiousprogrammer.wordpress.com/2009/07/13/my-emacs-defaults/
;; http://www.emacswiki.org/emacs/CopyAndPaste
;; (setq x-select-enable-clipboard t) ;; true by default in emacs24
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; To show multiple debugging windows such as breakpoints, locals, etc
;; http://www.saltycrane.com/blog/2009/07/notes-c-development-emacs-ubuntu-linux/
(setq gdb-many-windows t)


;;(global-set-key [f9] 'gdb)



;;==================================================
;; http://nflath.com/2009/08/easier-emacs/
;; (global-unset-key (kbd "<left>") )
;; (global-unset-key (kbd "<right>") )
;; (global-unset-key (kbd "<up>") )
;; (global-unset-key (kbd "<down>") )

;; (global-unset-key (kbd "C-<left>") )
;; (global-unset-key (kbd "C-<right>") )
;; (global-unset-key (kbd "C-<up>") )
;; (global-unset-key (kbd "C-<down>") )

;; (global-unset-key (kbd "M-<left>") )
;; (global-unset-key (kbd "M-<right>") )
;; (global-unset-key (kbd "M-<up>") )
;; (global-unset-key (kbd "M-<down>") )


;; Save all backup file in this directory.
;; http://homepages.inf.ed.ac.uk/s0243221/emacs/
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; i wanted to change the name of the default tags table file from TAGS
;; to tags as i hate typing cap letters... i wanted to simply write
;; make tags instead of make TAGS
;; http://www.nongnu.org/emacsdoc-fr/manuel/tags.html
;;
;; (setq tags-file-name "tags")
;;


;; LaTex ==> For GNU Emacs, the recommended way to activate AUCTeX and
;;preview-latex is to add the ==> following lines to your ~/.emacs
;;file:
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)


(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode

(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

;; To integrate RefTeX with AUCTeX
(setq reftex-plug-into-AUCTeX t)


;;https://www.gnu.org/software/auctex/manual/auctex/Parsing-Files.html
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

;;(setq TeX-PDF-mode t)


;; configure LaTeX to outpud pdf files instead of dvi
;; http://www.znasibov.info/posts/emacs-latex-and-pdf-viewer.html
;; (setq TeX-PDF-mode t)
;; TODO :: is there not a way to force latex output ps

;; TODO :: make xpdf the default viewer for pdfs produced by emacs

;; TODO :: if one uses the C-c C-c command in auctex then i want to
;; automatically run C-c C-c bibtex after it

;; TODO
;; http://www.hermann-uwe.de/blog/faster-and-more-comfortable-latex-editing-and-previewing-with-latexmk


;; Build comment box out of highlighted region
(global-set-key "\C-cx" 'box-region)

(fset 'box-region
      [?\C-u ?\M-| ?c ?o ?m ?m ?e ?n ?t return])


;;==================================================
;; http://stackoverflow.com/questions/2285036/display-nested-function-with-which-function-mode-in-emacs
;; http://emacs-fu.blogspot.com/2009/01/which-function-is-this.html

(which-function-mode 1)



;; http://www.freebsd.org/doc/en/books/developers-handbook/emacs.html
;;(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-m" 'reindent-then-newline-and-indent)



;; http://jmjeong.com/wikix/file/Emacs/key-bindings_el.txt
;; (global-map "C-<f6>" ,(read-kbd-macro "C-u <f6>"))
(global-set-key [f9] (read-kbd-macro "C-u M-."))
(global-set-key "\C-cn" (read-kbd-macro "C-u M-."))


(put 'narrow-to-region 'disabled nil)




;;==> To add the gnuplot mode in Emacs, add the content of /usr/share/emacs/site-lisp/dotemacs to your ~/.emacs file.
;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.plt$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode
;;(global-set-key [(f10)] 'gnuplot-make-buffer)
(global-set-key (kbd "<f10>")
                (lambda()
                  (interactive)
                  (shell-command-on-region (point-min) (point-max) "gnuplot")))
;; end of line for gnuplot-mode
;;--------------------------------------------------------------------


;; ;;http://code.google.com/p/autopair/
;; (add-to-list 'load-path "/home/m/.emacs.d/vendor/autopair") ;; comment if autopair.el is in stanard load path
;;(require 'autopair)
;;(autopair-global-mode) ;; enable autopair in all buffers


(setq show-trailing-whitespace t)

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

;; (setq-default abbrev-mode t)
;; (cond ((file-exists-p "~/.abb")
;;        (read-abbrev-file "~/.abb")))
;; (setq save-abbrevs t)


;; (setq inferior-lisp-program "/usr/bin/sbcl"
;;       lisp-indent-function 'common-lisp-indent-function)
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;; (require 'slime)
;; ;;(slime-setup)
;; (slime-setup '(slime-fancy))

;; http://homepages.spa.umn.edu/~ethrane/Resources/emacs/emacs.txt
;; (add-hook 'octave-mode-hook
;;           (lambda()
;;             (setq-default octave-comment-char 37)))

;; https://gist.github.com/2783141
;; (defun fix-octave-comments ()
;;     (make-local-variable 'comment-start)
;;     (set 'comment-start "%")
;;     (set 'comment-column 0))
;; (add-hook 'octave-mode-hook 'fix-octave-comments)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/autopair.el")
;; (require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers 

;; C-h v echo-keystrokes
(setq echo-keystrokes 0.1)

;; http://emacswiki.org/emacs-en/BackspaceKey
(global-set-key (kbd "C-h") 'delete-backward-char)

;; set C-, to toggle vim mode
(put 'set-goal-column 'disabled nil)

;;(load "vip")


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

