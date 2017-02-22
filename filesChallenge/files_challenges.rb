class StudentsList
    attr_accessor :file, :notes

    def initialize(file, notes)
        @file = file
        @notes = notes
    end

    def students_file
        file = open(@file)
        file_content = file.read

        file_content.each_line do |line|
            print "Maker #{line}"
        end

        file.close
    end

    def write_student
        print "Enter new student: "
        new_student = gets
        file = open(@file, 'a+')
        file.write(new_student)
        file.close
    end

    def copy_notes(file_to_copy)
        notes = open(@notes)
        notes_content = notes.read
        notes.close

        new_file = open(file_to_copy, "w+")
        new_file.write(notes_content)
        new_file.close
    end

    def create_contact(name, mail, phone, address, gender)
        contacts = open('contacts.txt', 'a+')
        contact = name + ',' + mail + ',' + phone + ',' + address + ',' + gender + "\n"
        contacts.write(contact)
        contacts.close
    end

    def show_contact
        contact = open('contacts.txt')
        contacts_content = contact.read

        contacts_content.each_line do |line|
            temp_content = line.split(',')
            puts """
                Name: #{temp_content[0]}
                Email: #{temp_content[1]}
                Phone: #{temp_content[2]}
                Address: #{temp_content[3]}
                Male: #{temp_content[4]}
            """
        end

        contact.close
    end
end

my_students = StudentsList.new('students.txt', 'notes.txt')
# my_students.students_file
# my_students.write_student
# my_students.students_file
# my_students.copy_notes("file_to_copy.txt")
# my_students.create_contact("john", "john.mejia@anomali", "300 863 2039", "Cll 50A #97 - 215", "male")
my_students.show_contact
puts "///////////////////////////////////////"
