require 'rails/generators/rails/generator/generator_generator'

class GeneratorFromDiffGenerator < Rails::Generators::GeneratorGenerator
  source_root File.expand_path('../templates', __FILE__)

  argument :baseline_revision, :type => :string, :banner => '<baseline-git-revision>'
  argument :change_revision,   :type => :string, :banner => '<changed-git-revision>'

  def create_patch
    create_file(File.join(generator_dir, "#{name}.patch"), adjusted_patch, :verbose => false)
  end

  protected

    def patch
      run "git diff --no-prefix #{baseline_revision} #{change_revision}"
    end

    def adjusted_patch
      patch.gsub(/#{Rails::Application.instance.class.name}/, '[APPNAME]')
    end
end
