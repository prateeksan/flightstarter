# Requires: attempt_access
# Optional: logout
RSpec.shared_examples 'login-required object' do
  it 'should not be able to access this without logging in' do
    if respond_to? :logout
      logout
    end
    attempt_access
    expect(response).not_to be_success
    redirect_to(login_url)
  end
end

# Requires: login_as_us, login_as_them, attempt_access
# Optional: successful_ownership_access
RSpec.shared_examples 'ownership-required object' do
  include_examples 'login-required object'

  context 'as non-owner' do
    before { login_as_them }

    it 'should not be able to access this' do
      attempt_access
      expect(response).not_to be_success
      expect(response.status).to eq 401
    end
  end

  context 'as owner' do
    before { login_as_us }

    it 'should be able to access this' do
      attempt_access
      if respond_to?(:successful_ownership_access)
        successful_ownership_access
      else
        expect(response).to be_success
      end
    end
  end
end
