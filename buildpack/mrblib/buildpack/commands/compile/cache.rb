class Buildpack::Commands::Compile::Cache
  BUILDPACK_CACHE_DIR = "ember-cli-deploy"

  def initialize(build_dir, cache_dir)
    @build_dir = build_dir
    @cache_dir = "#{cache_dir}/#{BUILDPACK_CACHE_DIR}"
  end

  def load(dir, path)
    src = "#{@cache_dir}/#{dir}"

    if File.exist?(src)
      FileUtilsSimple.cp_r(src, "#{@build_dir}/#{path}")
      true
    else
      false
    end
  end

  def store(dir)
    FileUtilsSimple.mkdir_p(@cache_dir)
    FileUtilsSimple.cp_r("#{@build_dir}/#{dir}", "#{@cache_dir}/")
  end
end
