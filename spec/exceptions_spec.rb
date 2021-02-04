describe NoBikesError do
  it 'raises No bikes! error' do
    expect { raise subject }.to raise_error(subject, 'No bikes!')
  end
end
