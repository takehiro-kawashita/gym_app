require 'rails_helper'

RSpec.describe LessonsController,type: :request do
     before do
      allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ auth: true })
    end
    
    describe '#index' do
        context 'lessons exist' do
            it 'response success' do
                get '/management/lessons'
                expect(response).to be_successful
            end
        end
        context 'lessons blank' do
            it 'response success' do
                get '/management/lessons'
                expect(response).to be_successful
            end
        end
    end
    
    describe '#show' do
        before do
            @lesson = FactoryBot.create(:lesson)
        end
        it 'response success' do
            get "/management/lessons/#{@lesson.id}"
            expect(response).to be_successful
        end
    end
    
    describe '#new' do
        it 'respose success' do
            get '/management/lessons/new'
            expect(response).to be_successful
        end
    end
    
     describe '#create' do
        context 'validation errors' do          
            let(:params){ {lesson:{ title:"",level:"",category:"",started_at:"",description:"",price:"",instructor:"",limits:"" }} }
            it 'render error' do
                post "/management/lessons",params: params
                expect(response.body).to include "登録失敗"
            end
        end
        
        context '登録完了' do
            let(:lesson) {build(:lesson)}
            let(:params){ {lesson:{ title:"ランニング",level:1,category:"脂肪燃焼",started_at:"2021/01/01 00:00",description:"xxxxxxxxxxxxxxxxxx",price:1000,instructor:"川下",limits:10 }} }
            let(:created_lesson) {Lesson.last}

            it 'response redirect' do
                post "/management/lessons",params: params
                expect(response.status).to redirect_to management_lessons_path
            end
            
            it 'response redirect' do
                expect{
                    post "/management/lessons",params: params
                }.to change{Lesson.count}.by(1)
            end
        end
    end
    
    describe '#edit' do
        context 'target exit' do
            before do
                @lesson = FactoryBot.create(:lesson)
            end
            it 'response success' do
                get "/management/lessons/#{@lesson.id}/edit"
                expect(response).to be_successful
            end
            
            it 'render lesson' do
                get "/management/lessons/#{@lesson.id}/edit"
                expect(response.body).to include @lesson.title
            end
        end
        
        context 'target un exit' do
            it 'response success' do
                expect{
                    get "/management/lessons/0/edit"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    
    describe '#update' do
        context '更新成功' do
            let(:lesson) {create(:lesson)}
            let(:params){ {lesson:{ title:"ランニング",level:1,category:"脂肪燃焼",started_at:"2021/01/01 00:00",description:"xxxxxxxxxxxxxxxxxx",price:1000,instructor:"川下",limits:10 }} }           
            
            it 'response redirect' do
                patch "/management/lessons/#{lesson.id}" ,params: params
                expect(response.status).to redirect_to management_lesson_path(lesson.id)
            end
        end
        
        context '更新失敗' do
            let(:lesson) {create(:lesson)}
            let(:params){ {lesson:{ title:"",level:1,category:"",started_at:"",description:"",price:1000,instructor:"",limits:10 }} }           
            
            it 'response redirect' do
                patch "/management/lessons/#{lesson.id}" ,params: params
                expect(response).to be_successful
            end
        end
    end
    
    describe '#destroy' do
        context '削除成功' do
            before do
                @lesson = FactoryBot.create(:lesson)
                Lesson.create(title:"ランニング",level:1,category:"脂肪燃焼",started_at:"2021/01/01 00:00",description:"xxxxxxxxxxxxxxxxxx",price:1000,instructor:"川下",limits:10)
            end
            
            it "delete success" do
                expect{
                    delete "/management/lessons/#{@lesson.id}"
                }.to change{Lesson.count}.by(-1)
            end
            
            it 'response redirect' do
                delete "/management/lessons/#{@lesson.id}"
                expect(response.status).to redirect_to management_lessons_path
            end
        end
    end
end