class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
    raise Pundit::NotLoggedInError.new "Vous devez être connecté(e) pour accéder à cette page." if !@user and @record
  end

  # def index?
  #   false
  # end

  def personne
    Personne.find_by_id_res(user.id_res)
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  # def create?
  #   false
  # end

  # def new?
  #   create?
  # end

  # def update?
  #   false
  # end

  # def edit?
  #   update?
  # end

  # def destroy?
  #   false
  # end

  def manage?
    user and user.valeur_privilege(:administrateur) == true
  end

  # On peut voir les détail si :
  # - on est administrateur
  # - on a la droit de consulter une fiche détaillée
  # - on se regarde soi-même
  def voir_details?
    manage? or user.valeur_privilege("consultation_fiche_resumee") != true or @record.try(:id_res) == user.try(:id_res)
  end

  def suppression_autorisee?
    record.respond_to?(:suppression_autorisee?) and record.suppression_autorisee? and manage?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Tout ce qui n'est pas prévu n'est pas autorisé, sauf si on est administrateur, niark niark !
  def method_missing(m, *args, &block)
    manage?
  end

  # Administrateur
  def administrateur?
    user.valeur_privilege(:administrateur) == true
  end

  def gestionnaire_ci?
    if administrateur? or user.valeur_privilege(:gestionnaire_ci) == true
      true
    end
  end

  def ci_administrables?(ci: nil)
    if user.valeur_privilege(:administrateur) == true
      true
    else
      ci != nil and (user.valeur_privilege(:ci_administrables)||[]).include? ci.code
    end
  end

  def ci_consultables?(ci: nil)
    ci_administrables?(ci: ci) or (user.valeur_privilege(:ci_consultables)||[]).include? ci.code
  end

  def gestionnaire_d_application?
    if user.valeur_privilege(:administrateur) == true
      true
    else
      ci != nil and (user.valeur_privilege(:ci_administrables)||[]).map(&:presence).compact.any?
    end
  end

  def gestion_taches?
    manage? or user.valeur_privilege(:gestion_taches) == true
  end

#  def recalculer_les_profils?
#    gestionnaire_d_application?
#  end

  def creation_export?
    user.valeur_privilege(:creation_export) == true
  end

  def creation_regle?
    user.valeur_privilege(:creation_regle) == true
  end

  def outils_traitement_masse?
    user.valeur_privilege(:outils_traitement_masse) == true
  end

  # Personne
  def gerer_les_personnes?
    administrateur? or consultation_fiche_detaillee? or consultation_fiche_resumee? or gestionnaire_d_application?
  end

  def consultation_fiche_detaillee?
    user.valeur_privilege(:consultation_fiche_detaillee) == true or user.try(:id_res) == @record.try(:id_res) or manage?
  end

  def consultation_fiche_resumee?
    user.valeur_privilege(:consultation_fiche_resumee) == true
  end

  def recherche_multicritere?
    user.valeur_privilege(:recherche_multicritere) == true
  end

  def etiquette_rpps
    voir_details?
  end

  def validation_identites?
    user.valeur_privilege(:validation_identites) == true
  end

  # Structures
  def consultation_structure?
    user.valeur_privilege(:consultation_structure) == true
  end

  def modification_structure?
    user.valeur_privilege(:modification_structure) == true
  end

  # Correspondants
  def creation_correspondant?
    user.valeur_privilege(:creation_correspondant) == true
  end

  def consultation_correspondant?
    user.valeur_privilege(:consultation_correspondant) == true
  end

  def abonnement_correspondant_appli?
    user.valeur_privilege(:abonnement_correspondant_appli) == true
  end

  def gerer_modeles_champ?
    user.valeur_privilege(:gerer_modeles_champ) == true
  end


  class Scope
    attr_reader :user, :scope

    def personne
      Personne.find_by_id_res(@user.id_res)
    end

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

