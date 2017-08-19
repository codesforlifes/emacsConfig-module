;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; 自动安装包

(require 'cl)
;; 以后添加插件 只要在（添加就可以），再重启一下
(defvar packageLists '(
					   company
					   monokai-theme
					   hungry-delete
					   smex
					   swiper
					   counsel
					   smartparens
					   js2-mode
					   nodejs-repl
					   emmet-mode
					   racket-mode
					   popwin) "default packages")

;; 便于管理插件
(setq package-selected-packages packageLists)

(defun jorden/install ()
  (loop for pkg in packageLists
		when (not (package-installed-p pkg))
		do (return nil)
		finally (return t)))

(unless (jorden/install)
  (message "%s" "Refreshing package database")
  (package-refresh-contents)
  (dolist (pkg packageLists)
	(when (not (package-installed-p pkg))
	  (package-install pkg))))

;; emmet-mode 设置
(add-to-list 'load-path "~/emacs.d/emmet-mode")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 4))) ;; indent 4 spaces.
(setq emmet-move-cursor-after-expanding nil) ;; default t
(setq emmet-expand-jsx-className? t) ;; default nil
(setq emmet-self-closing-tag-style " /") ;; default "/"
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-c r") 'racket-run)))
(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)
(setq tab-always-indent 'complete)

;; popwin 配置
(require 'popwin)
(popwin-mode t)
;; js2-mode config-changed-event

(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   auto-mode-alist))

;; company config-changed-event
;; company 延时0.1s
(setq-default company-idle-delay 0.1)
;; company 在出现一个字的时候就启动
(setq-default company-minimum-prefix-length 1)

(require 'smartparens-config)
;; Always start smartparens mode in js-mode.
(add-hook 'js-mode-hook #'smartparens-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; smex
  (require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay; when Smex is auto-initialized on its first run.
;; 一次删除所有空格
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 全局使用company插件
(add-hook 'after-init-hook 'global-company-mode)
;; 使用company
;;(global-company-mode t)

;; 导出整个文件
 (provide 'init-packages)
