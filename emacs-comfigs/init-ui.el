;;;;;;;;;;;;;;;;;;;;;;;;;;;;;基本配置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;外观设置
;;颜色设置，其实有个color-theme.el可以将Emacs设置丰富多彩，非常漂亮，不过启动有些慢，我只是选择了一些颜色设置。
;;;;;去掉工具栏
(tool-bar-mode -1)

;;;;;去掉菜单栏，我将F10绑定为显示菜单栏，万一什么东西忘了，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单
;;(menu-bar-mode -1)

;;;;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了
(scroll-bar-mode -1)

;;;;;改变emacs标题栏的标题
(setq frame-title-format "new world")
;; 显示列号
(setq column-number-mode t)

;;开启语法高亮。
(global-font-lock-mode 1)

;;设置tab为4个空格的宽度
(setq default-tab-width 4)
(setq c-basic-offset 4)

;;;;;;;;;  设置界面 start
(set-cursor-color "Wheat")
(set-mouse-color "Wheat")
(set-foreground-color "Wheat")
(set-background-color "DarkSlateGray")
(if window-system
        (setq default-frame-alist
                (append
                        '( (top . 80)
                                 (left . 100)
                                             (width . 110)
                                             (height . 35))
                                                                  default-frame-alist))
)
;;;启动最大化
;;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 97) (height . 49)))
;;;;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)

;;;;;时间使用24小时制
(setq display-time-24hr-format t)

;;;;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

;;;;;时间的变化频率，单位多少来着？
(setq display-time-interval 10)

;;;;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)



;;;;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了
(mouse-avoidance-mode 'animate)

;;;;;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)

;;;高亮显示要拷贝的内容
(transient-mark-mode 1)

;;;;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)

;;;;;是用滚轴鼠标
(mouse-wheel-mode t)
;; 自动存盘
(setq auto-save-mode t)

;;;;;去掉烦人的警告铃声
(setq visible-bell -1)

;;;;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
        scroll-margin 3
        scroll-conservatively 10000)

;;;;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;;;;;是用aspell程序作为Emacs的拼写检查成学
(setq-default ispell-program-name "aspell")

;;不要生成临时文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;;禁用启动信息
(setq inhibit-startup-message t)

;;以y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;显示行号
(column-number-mode t)

;; 设置tab为4个空格的宽度
(setq default-tab-width 4)

;; 使用ctrl+c ctrl+v
(cua-mode t)

;; 显示行号
(global-linum-mode t)

;; 高亮当前行
(global-hl-line-mode t)



;; 更改光标的模式
(setq-default cursor-type 'bar)

;; 自动匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 删除选中的区域

(delete-selection-mode t)

(global-auto-revert-mode t)

;;;;;备份设置
;;;;;emacs还有一个自动保存功能，默认在~/.emacs.d/auto-save-list里，这个非常有用，我这里没有改动，具体可以参见Sams teach yourself emacs in 24hours(我简称为sams24)
;;;;;启用版本控制，即可以备份多次
(setq version-control t)

;;;;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 2)

;;;;;备份最新的版本五次，理解同上
(setq kept-new-versions 5)

;;;;;删掉不属于以上7中版本的版本
(setq delete-old-versions t)

;;;;;设置备份文件的路径
(setq backup-directory-alist '(("." . "~/.emacs.tmp")))

;;;;;备份设置方法，直接拷贝
(setq backup-by-copying t)



;;;;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)
;;;;;这个东西必须放在最后
;;;;;desktop.el是一个可以保存你上次emacs关闭时的状态，下一次启动时恢复为上次关闭的状态。就和vmware的suspend一样。
;;;;;因为我要使用sawfish-mode,wiki-mode,html-helper-mode，放在这里才能保证下次启动时能正确辨认文件需要的模式。
(load "desktop")
(desktop-load-default)
(desktop-read)

;; 缩进优化
;;(electric-indent-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;基本配置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-ui)
