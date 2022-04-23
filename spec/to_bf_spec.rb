# frozen_string_literal: true

RSpec.describe ToBf do
  it "has a version number" do
    expect(ToBf::VERSION).not_to be nil
  end

  it "will return a BF program for a string" do
    exapected = "++++++++++"
    exapected += "[>++++++++++++>+++++++++++>++++++++++>+++++++++++<<<<-]"
    exapected += ">+.>+.>++++++++.>+."

    expect("yolo".to_bf).to eq(exapected)
  end

  it "will return a empty BF program for a emptystring" do
    expect("".to_bf).to eq("")
  end

  it "will return a BF program for a alfanumeric string" do
    expected = "++++++++++"
    expected += "[>++++++++++++>+++++++++++>++++++++++>+++++++++++>++++>+++++>+++++<<<<<<<-]"
    expected += ">+.>+.>++++++++.>+.>+++++++++.>.>+."

    expect("yolo123".to_bf).to eq(expected)
  end

  it "will raise an exception for a unicode string" do
    expect { "😭".to_bf }.to raise_error(Exception)
  end

  it "will raise an exception for a string with unice characters" do
    expect { "this should not work 😭".to_bf }.to raise_error(Exception)
  end
end
