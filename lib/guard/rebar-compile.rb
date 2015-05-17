require 'guard/plugin'

module Guard
  class RebarCompile < Plugin

    def initialize(options = {})
      super
      options[:skip_deps] = true if options[:skip_deps].nil?
    end

    def start
      run_all if options[:all_on_start]
    end

    def run_all
      cmd = "rebar compile #{handle_skip_deps}"
      UI.info "#{cmd}"
      handle_output(`#{cmd}`)
    end

    def run_on_change(paths = [])
      paths.each do |path|
        UI.info "changed: #{path}"
      end
      cmd = "rebar compile #{handle_skip_deps}"
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

    def handle_skip_deps
      options[:skip_deps] ? "skip_deps=true " : ""
    end

    def title
      "Rebar Compile: #{directory_name}"
    end

    def directory_name
      "#{File.basename(Dir.pwd)}"
    end
  end
end
