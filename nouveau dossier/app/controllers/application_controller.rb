class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ===
   include AuthenticatedSystem
  # include Pundit

  # before_action do |c|
  #   User.current_user = c.try(:current_user)
  # end

  # after_action :verify_policy_scoped, :only => :index
  # after_action :verify_authorized, :except => [:index, :add_nested_fields, :stream]

  # # Décommenter cette ligne si vous incluez ckEditor avec Pundit
  # # after_action :ckeditor_authorize!


  # class Pundit::NotLoggedInError < Pundit::Error
  # end

  # rescue_from Pundit::NotLoggedInError,               with: :user_not_authorized
  # rescue_from Pundit::NotAuthorizedError,             with: :user_not_authorized
  # rescue_from Pundit::NotDefinedError,                with: :policy_not_defined
  # rescue_from Pundit::PolicyScopingNotPerformedError, with: :policy_not_defined

  # def user_not_authorized(e)
  #   if current_user
  #     flash[:alert] = "Vous n'avez pas les autorisations pour effectuer cette action (#{action_name} pour le contrôleur #{controller_name})."
  #     redirect_to(request.referrer || root_path)
  #   else
  #     session[:return_to] = request.fullpath
  #     redirect_to login_url, :alert => "Vous devez vous connecter pour continuer."
  #   end
  # end

  # def policy_not_defined(e)
  #   flash[:alert] = "La gestion des droits n'a pas été définie pour cette classe, elle n'est donc pas autorisée.\n(#{e.message})."
  #   # redirect_to(request.referrer || root_path)
  # end
  #  ===


  # ------ KERBEROS ------
  # On veut que l'appli authentifie ses utilisateurs en KERBEROS
  # Par défaut, même si on ne définit rien, kerberos? renvoie false
  # Décommenter la fonction ci-dessous pour faire du KERBEROS.
  # def kerberos?
  #   true
  # end

  # ------ CAS ------
  # On veut que l'appli authentifie ses utilisateurs en CAS
  # Par défaut, même si on ne définit rien, cas? renvoie false
  # Décommenter la fonction ci-dessous pour faire du CAS.
  def cas?
    true
  end

end
