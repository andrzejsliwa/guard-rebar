require 'guard/guard'

module Guard
  class RebarDeps < Guard

    def initialize(watchers = [], options = {})
      super
      options[:skip_deps] = true if options[:skip_deps].nil?
    end

    def start
      run_all if options[:all_on_start]
    end

    def run_all
      cmd = "rebar get-deps"
      UI.info "#{cmd}"
      handle_output(`#{cmd}`)
    end

    def run_on_change(paths = [])
      paths.each do |path|
        UI.info "changed: #{path}"
      end
      cmd = "rebar update-deps"
      UI.info "#{cmd}"
      handle_output(`#{cmd}`)
    end

    def handle_output(output, suite = nil)
      suite = directory_name unless suite
      if $? == 0
        Notifier.notify(suite, title: title, image: :success)
        UI.info output
      else
        Notifier.notify(suite, title: title, image: :failed)
        UI.error output
      end
    end

    def title
      "Rebar Deps: #{directory_name}"
    end

    def directory_name
      "#{File.basename(Dir.pwd)}"
    end
  end
end