require 'json'
require 'time'
require 'prawn'

class Note
  attr_accessor :title, :content, :timestamp

  def initialize(title, content, timestamp = Time.now)
    @title = title
    @content = content
    @timestamp = timestamp
  end

  def self.load_notes
    return [] unless File.exist?('note_data.json')
    
    note_data = JSON.parse(File.read('note_data.json'))
    return note_data
  end

  def self.save_notes(notes)
    File.write('note_data.json', JSON.pretty_generate(notes.map { |note| { 'title' => note.title, 'content' => note.content, 'timestamp' => note.timestamp } }))
  end

  def self.create(title, content)
    notes = load_notes
    new_note = Note.new(title, content)
    notes.push(new_note)
    save_notes(notes)
  end


  def self.update(note_title, new_title, new_content)
    notes = load_notes
    note = notes.find { |n| n.title == note_title }

    if note
      note.title = new_title
      note.content = new_content
      note.timestamp = Time.now
      save_notes(notes)
      true
    else
      false
    end
  end

  def self.delete(note_title)
    notes = load_notes
    notes.reject! { |note| note.title == note_title }
    save_notes(notes)
  end

  def self.note_pdf(note_title)
    notes = load_notes
    note = notes.find { |n| n.title == note_title }
    return unless note

    
    Prawn::Document.generate("#{note_title}.pdf") do |pdf|
      pdf.text "Note Title: #{note.title}"
      pdf.text "Timestamp: #{note.timestamp}"
      pdf.text "Content: #{note.content}"
    end
  end
end

