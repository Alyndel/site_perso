class Ability
  include CanCan::Ability

  def initialize(user)

    if user

      if Ability.est?("admin")
        can :manage, :all
      end

      ## Définir les accès des autres profils selon la même méthode
      #
      # if Ability.est?("test")
      #   can :update, :all
      # end
      #
      
    else
      can :read, :all

    end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

  private
  def self.est?(profil)
    profilM = profil.upcase
    profilm = profil.downcase
    profilc = profil.capitalize
    prefix = CI + "_"
    profils = User.current_user.profils
    profils.include?(prefix+profilM) or profils.include?(prefix+profilm) or profils.include?(prefix+profilc)

    # ou en une seule ligne
    User.current_user.profils.detect{|p| p.match(/#{CI+'_'+profil}/i)} != nil

    # Remarque : c'est pas sûr que tous les profils aient un code qui commence bien par CIxxxx_.
    #            Donc, l'ajouter systématiquement présente un risque
  end

end
