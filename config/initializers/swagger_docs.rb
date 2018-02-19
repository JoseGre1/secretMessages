include Swagger::Docs::ImpotentMethods
Swagger::Docs::Config.base_api_controller = ActionController::API

class Swagger::Docs::Config
  def self.transform_path(path, _api_version)
    # Make a distinction between the APIs and API documentation paths.
    "docs/#{path}"
  end
end

Swagger::Docs::Config.register_apis(
  "1.0":
    {
      api_file_path: "public/docs",
      base_path: "http://localhost:3000",
      base_api_controller: ActionController::API,
      clean_directory: true,
      attributes: {
        info: {
          "title": "secretMessages App",
          "description": "Back-end Service for storing secret messages at different locations.",
          "contact": "gjhernandez@uninorte.edu.co",
          "license": "GNU General Public License v3.0",
          "licenseUrl": "https://www.gnu.org/licenses/gpl-3.0.en.html",
        },
      },
    },
)
