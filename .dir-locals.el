((nil . ((eval . (progn
                   (setq-local
                    projectile-project-run-cmd
                    (lambda ()
                      (let ((buffer-name "*vterm--platformer--build*")
                            (pre-current-window (selected-window)))
                        (if (not (get-buffer buffer-name))
                            (with-current-buffer (get-buffer-create buffer-name)
                              (vterm-mode)))
                        (pop-to-buffer buffer-name)
                        (vterm-send-key (kbd "C-c"))
                        ;; error send ls while send C-c
                        (vterm-send-key (kbd "SPC"))
                        (vterm-send-string "cargo run\n")
                        (select-window pre-current-window)))

                    projectile-project-run-cmd-1
                    (lambda ()
                      (let ((compilation-always-kill t)
                            (compilation-read-command nil))
                        (compile (format "%s%s" (projectile-project-root) "target/debug/platformer") t)))

                    projectile-project-run-cmd-2
                    (lambda ()
                      (save-current-buffer
                        (let ((compilation-buffer-name-function (lambda (_mode)
                                                                  "*compi--platformer--ls*"))
                              (compilation-always-kill t) (compilation-read-command nil))
                          (set-buffer (compile "ls -la" t)))))

                    projectile-project-run-cmd-3
                    (lambda ()
                      (let ((buffer-name "*vterm--platformer--build*")
                            (pre-current-window (selected-window)))
                        (if (not (get-buffer buffer-name))
                            (with-current-buffer (get-buffer-create buffer-name)
                              (vterm-mode)))
                        (pop-to-buffer buffer-name)
                        (vterm-send-key (kbd "C-c"))
                        ;; error send ls while send C-c
                        (vterm-send-key (kbd "SPC"))
                        (vterm-send-string "cargo build\n")
                        (select-window pre-current-window)))

                    projectile-project-run-cmd-4
                    (lambda ()
                      (let* ((buffer-name "*vterm--platformer--build*")
                            (pre-current-window (selected-window)))
                        (unless (get-buffer buffer-name)
                            (get-buffer-create buffer-name))
                        (pop-to-buffer buffer-name)
                        (unless (eq major-mode 'vterm-mode)
                            (vterm-mode))
                        (vterm-send-string " ")
                        (vterm-send-key (kbd "C-c"))
                        ;; error send ls while send C-c
                        (vterm-send-key (kbd "SPC"))
                        (vterm-send-string "cargo run\n")
                        (select-window pre-current-window)))))))))
