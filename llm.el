;; (load-env-vars "~/.env")


(setq gptel-model   'deepseek-chat
      gptel-backend
      (gptel-make-openai "litellm"
        :protocol "http"
        :host "0.0.0.0:4000"
        :stream t
        ;; :key (lambda () (getenv "OPENROUTER_API_KEY"))
        :key "sk-1234"
        :models '(deepseek-chat
                  gemini-2
                  qwen3
                  )))
