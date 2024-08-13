class PatientRequestPolicy < ApplicationPolicy
  attr_reader :user, :patient_request

  def initialize(user, patient_request)
    @user = user
    @patient_request = patient_request
  end

  def index?
    true
  end

  def show?
    user == patient_request.user || user.has_role?(:admin)
  end

  def create?
    true
  end

  def update?
    user == patient_request.user || user.has_role?(:admin)
  end

  def destroy?
    user == patient_request.user || user.has_role?(:admin)
  end

end
