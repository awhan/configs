;; -*- mode: Emacs-lisp -*-

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
;;  '(inhibit-startup-screen t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


;; M-x blink-cursor-mode
(blink-cursor-mode -1)

;; cursor stretches to cover whole glyph
(setq x-stretch-cursor t)

;; http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;; initialize installed packages
(package-initialize)

;; http://auto-complete.org/
;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
;;(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150315.612")
(require 'auto-complete-config)
(ac-config-default)

(require 'ido)
(ido-mode t)


(show-paren-mode)


;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key [(control h)] 'delete-backward-char)
(put 'narrow-to-region 'disabled nil)

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))


(tool-bar-mode -1)
;;https://www.gnu.org/software/emacs/manual/html_node/emacs/Display-Custom.html#Display-Custom 
(setq echo-keystrokes 0.1)


(global-hl-line-mode 1)


(setq x-select-enable-clipboard t)
