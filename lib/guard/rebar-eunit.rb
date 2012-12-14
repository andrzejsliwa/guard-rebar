require 'guard/guard'

module Guard
  class RebarEunit < Guard

    def initialize(watchers = [], options = {})
      super
      options[:skip_deps] = true if options[:skip_deps].nil?
    end

    def start
      run_all if options[:all_on_start]
    end

    def run_all
      cmd = "rebar eunit #{handle_skip_deps}"
      UI.info "#{cmd}"
      handle_output(`#{cmd}`)
    end

    def run_on_change(paths = [])
      suites = []
      paths.each do |path|
        UI.info "changed: #{path}"
        if suite = path.match(%r{.*?/([^.].*?)_tests?.erl$})
          suites << suite[1]
        elsif suite = path.match(%r{.*?/([^.].*?)?.erl$})
          suites << suite[1]
        end
      end
      cmd = "rebar eunit #{handle_skip_deps}suites=#{suites.join(",")}"
      UI.info "#{cmd}"
      handle_output(`#{cmd}`, suites.join(" "))
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
      options[:skip_deps] ? "skip_deps=true" : ""
    end

    def title
      "Rebar: #{directory_name}"
    end

    def directory_name
      "#{File.basename(Dir.pwd)}"
    end
  end
end