import { mount } from '@vue/test-utils'
import VideoModal from '../../app/javascript/video-modal.vue'

// TODO: Add test

describe('VideoModal', () => {
    it('is a Vue instance', () => {
        const wrapper = mount(VideoModal)
        expect(wrapper.vm).toBeTruthy()
    })
})