shared_examples 'valid names' do |v_names|
  v_names.each do |n_n|
    it "is valid: `#{n_n}`" do
      name_assigner(n_n)
      expect(subject).to be_valid
    end
  end
end

shared_examples 'invalid names' do |i_names|
  i_names.each do |i_n|
    it "is invalid: `#{i_n}`" do
      name_assigner(i_n)
      expect(subject).not_to be_valid
    end
  end
end

def name_assigner(name)
  subject.name = name
rescue NoMethodError
  subject.author = name
end
